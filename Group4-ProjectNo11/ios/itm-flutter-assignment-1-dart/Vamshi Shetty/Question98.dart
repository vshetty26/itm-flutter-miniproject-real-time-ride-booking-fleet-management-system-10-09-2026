abstract class Database {
  void connect();
  void disconnect() {
    print("Disconnected from database");
  }
}

class MySQL extends Database {
  @override
  void connect() {
    print("Connected to MySQL database");
  }
}

void main() {
  MySQL db = MySQL();
  db.connect();
  db.disconnect();
}
