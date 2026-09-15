const express = require('express');
const cors = require('cors');
const fs = require('fs');
const path = require('path');
const crypto = require('crypto');

const app = express();
const PORT = process.env.PORT || 3000;
const DATA_DIR = path.join(__dirname, 'data');
const DB_PATH = path.join(DATA_DIR, 'db.json');

app.use(cors());
app.use(express.json());

const defaultDb = {
  users: [
    {
      id: 'demo-rider-1',
      name: 'Alex Morgan',
      email: 'user@rideflow.com',
      password: '123456',
      role: 'rider',
      createdAt: new Date().toISOString(),
    },
    {
      id: 'demo-driver-1',
      name: 'Raj Sharma',
      email: 'driver@rideflow.com',
      password: '123456',
      role: 'driver',
      licenseNumber: 'MH1420230012345',
      carNumber: 'MH 43 BK 7821',
      carBrand: 'Maruti Suzuki Dzire',
      createdAt: new Date().toISOString(),
    },
    {
      id: 'demo-driver-2',
      name: 'Amit Verma',
      email: 'amit@rideflow.com',
      password: '123456',
      role: 'driver',
      licenseNumber: 'MH1320230054321',
      carNumber: 'MH 02 AB 4411',
      carBrand: 'Hyundai Creta',
      createdAt: new Date().toISOString(),
    },
  ],
  rides: [],
};

function ensureDb() {
  if (!fs.existsSync(DATA_DIR)) {
    fs.mkdirSync(DATA_DIR, { recursive: true });
  }

  if (!fs.existsSync(DB_PATH)) {
    fs.writeFileSync(DB_PATH, JSON.stringify(defaultDb, null, 2), 'utf8');
  }
}

function readDb() {
  ensureDb();
  const raw = fs.readFileSync(DB_PATH, 'utf8');
  return JSON.parse(raw);
}

function writeDb(db) {
  fs.writeFileSync(DB_PATH, JSON.stringify(db, null, 2), 'utf8');
}

function sanitizeUser(user) {
  const { password, ...safeUser } = user;
  return safeUser;
}

function getDriverCount(db) {
  return db.users.filter((user) => user.role === 'driver').length;
}

function calculateFare(distanceKm, db) {
  const drivers = getDriverCount(db);
  const baseFare = 120;
  const perKmFare = 18;
  const surge = drivers < 3 ? 1.3 : drivers < 5 ? 1.15 : 1;
  return Math.round((baseFare + distanceKm * perKmFare) * surge);
}

app.get('/api/health', (req, res) => {
  res.json({
    ok: true,
    message: 'RideFlow backend is running',
    timestamp: new Date().toISOString(),
  });
});

app.post('/api/auth/signup', (req, res) => {
  const { name, email, password, role, licenseNumber, carNumber, carBrand } = req.body;

  if (!name || !email || !password) {
    return res.status(400).json({ message: 'Name, email and password are required.' });
  }

  const db = readDb();
  const normalizedEmail = String(email).trim().toLowerCase();

  if (db.users.some((user) => user.email.toLowerCase() === normalizedEmail)) {
    return res.status(409).json({ message: 'User already exists with this email.' });
  }

  const userRole = role === 'driver' ? 'driver' : 'rider';
  const newUser = {
    id: crypto.randomUUID(),
    name: String(name).trim(),
    email: normalizedEmail,
    password: String(password),
    role: userRole,
    licenseNumber: userRole === 'driver' ? String(licenseNumber || '') : '',
    carNumber: userRole === 'driver' ? String(carNumber || '') : '',
    carBrand: userRole === 'driver' ? String(carBrand || '') : '',
    createdAt: new Date().toISOString(),
  };

  db.users.push(newUser);
  writeDb(db);

  return res.status(201).json({
    user: sanitizeUser(newUser),
    token: `demo-token-${newUser.id}`,
  });
});

app.post('/api/auth/login', (req, res) => {
  const { email, password } = req.body;

  if (!email || !password) {
    return res.status(400).json({ message: 'Email and password are required.' });
  }

  const db = readDb();
  const user = db.users.find(
    (entry) => entry.email.toLowerCase() === String(email).trim().toLowerCase() && entry.password === String(password)
  );

  if (!user) {
    return res.status(401).json({ message: 'Invalid email or password.' });
  }

  return res.json({
    user: sanitizeUser(user),
    token: `demo-token-${user.id}`,
  });
});

app.get('/api/drivers', (req, res) => {
  const db = readDb();
  const drivers = db.users
    .filter((user) => user.role === 'driver')
    .map((user) => sanitizeUser(user));

  res.json({ drivers });
});

app.post('/api/rides/request', (req, res) => {
  const { riderId, pickupLocation, destination, distanceKm } = req.body;

  if (!riderId || !pickupLocation || !destination) {
    return res.status(400).json({ message: 'Rider, pickup and destination are required.' });
  }

  const db = readDb();
  const rider = db.users.find((user) => user.id === riderId && user.role === 'rider');

  if (!rider) {
    return res.status(404).json({ message: 'Rider not found.' });
  }

  const distance = Number(distanceKm) || 12;
  const ride = {
    id: crypto.randomUUID(),
    riderId,
    pickupLocation: String(pickupLocation),
    destination: String(destination),
    distanceKm: distance,
    fare: calculateFare(distance, db),
    status: 'pending',
    driverId: null,
    createdAt: new Date().toISOString(),
  };

  db.rides.push(ride);
  writeDb(db);

  return res.status(201).json({ ride });
});

app.get('/api/rides', (req, res) => {
  const { riderId } = req.query;
  const db = readDb();

  const rides = riderId
    ? db.rides.filter((ride) => ride.riderId === String(riderId))
    : db.rides;

  res.json({ rides });
});

app.post('/api/rides/:rideId/decision', (req, res) => {
  const { rideId } = req.params;
  const { driverId, accepted } = req.body;

  if (!driverId) {
    return res.status(400).json({ message: 'Driver ID is required.' });
  }

  const db = readDb();
  const ride = db.rides.find((entry) => entry.id === rideId);

  if (!ride) {
    return res.status(404).json({ message: 'Ride not found.' });
  }

  const driver = db.users.find((user) => user.id === driverId && user.role === 'driver');
  if (!driver) {
    return res.status(404).json({ message: 'Driver not found.' });
  }

  ride.driverId = driverId;
  ride.status = accepted === true ? 'accepted' : 'rejected';
  ride.driverName = driver.name;
  ride.updatedAt = new Date().toISOString();

  writeDb(db);

  return res.json({ ride });
});

app.listen(PORT, () => {
  console.log(`RideFlow backend running on http://localhost:${PORT}`);
});
