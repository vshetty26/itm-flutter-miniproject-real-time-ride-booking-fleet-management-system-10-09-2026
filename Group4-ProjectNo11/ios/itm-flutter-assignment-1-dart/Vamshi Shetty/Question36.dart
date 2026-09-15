class Animal {
  void sound() {
    print("Animal sound");
  }
}

class Dog extends Animal {
  @override
  void sound() {
    print("Woof");
  }
}

class Cat extends Animal {
  @override
  void sound() {
    print("Meow");
  }
}

void main() {
  Dog d = Dog();
  Cat c = Cat();
  d.sound();
  c.sound();
}
