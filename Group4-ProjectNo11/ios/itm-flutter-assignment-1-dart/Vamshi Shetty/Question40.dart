class Parent {
  void message() {
    print("Parent message");
  }
}

class Child extends Parent {
  @override
  void message() {
    print("Child message");
  }
}

void main() {
  Parent obj = Child();
  obj.message();
}
