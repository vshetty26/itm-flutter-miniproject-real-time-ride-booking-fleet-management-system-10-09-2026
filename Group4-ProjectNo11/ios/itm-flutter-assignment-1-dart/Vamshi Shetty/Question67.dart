mixin Greetable {
  void greet() {
    print("Hello!");
  }
}

class Person with Greetable {}

void main() {
  Person p = Person();
  p.greet();
}
