abstract class Base {
  void show() {
    print("This is a non-overridable logic in standard design patterns");
  }
}

class Derived extends Base {}

void main() {
  Derived d = Derived();
  d.show();
}
