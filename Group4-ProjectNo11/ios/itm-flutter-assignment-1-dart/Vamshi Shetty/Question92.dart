abstract class Appliance {
  String brand;
  Appliance(this.brand) {
    print("Appliance constructor: $brand");
  }
}

class WashingMachine extends Appliance {
  WashingMachine(String brand) : super(brand) {
    print("WashingMachine constructor");
  }
}

void main() {
  WashingMachine("Samsung");
}
