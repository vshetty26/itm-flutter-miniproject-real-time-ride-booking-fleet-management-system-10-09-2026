abstract class Vehicle {
  void start();
}

class Car extends Vehicle {
  @override
  void start() {
    print("Car starting");
  }
}

class Bike extends Vehicle {
  @override
  void start() {
    print("Bike starting");
  }
}

void main() {
  Vehicle v1 = Car();
  Vehicle v2 = Bike();
  v1.start();
  v2.start();
}
