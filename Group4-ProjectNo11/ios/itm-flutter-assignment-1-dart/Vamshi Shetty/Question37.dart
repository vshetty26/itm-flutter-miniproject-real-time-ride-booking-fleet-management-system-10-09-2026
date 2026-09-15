class Parent {
  String name;
  Parent(this.name);

  void show() {
    print("Parent show: $name");
  }
}

class Child extends Parent {
  Child(String name) : super(name);

  @override
  void show() {
    super.show();
    print("Child show");
  }
}

void main() {
  Child c = Child("John");
  c.show();
}
