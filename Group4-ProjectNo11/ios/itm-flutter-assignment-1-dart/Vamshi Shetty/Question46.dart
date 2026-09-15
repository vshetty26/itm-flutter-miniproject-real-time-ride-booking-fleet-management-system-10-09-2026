abstract class Appliance {
  void turnOn();
  void showType() {
    print("Home appliance");
  }
}

class Fan extends Appliance {
  @override
  void turnOn() {
    print("Fan is running");
  }
}

void main() {
  Fan f = Fan();
  f.showType();
  f.turnOn();
}
