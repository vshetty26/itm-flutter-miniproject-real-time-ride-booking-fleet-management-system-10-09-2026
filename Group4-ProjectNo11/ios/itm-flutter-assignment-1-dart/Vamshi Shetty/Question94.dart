class Grandparent {
  void message() => print("Grandparent");
}

class Parent extends Grandparent {
  @override
  void message() => print("Parent");
}

class Child extends Parent {
  @override
  void message() => print("Child");
}

void main() {
  Child c = Child();
  c.message();
}
