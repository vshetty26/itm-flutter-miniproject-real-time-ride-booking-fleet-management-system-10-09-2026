abstract class Animal {
  void sound();
}

class Dog extends Animal {
  @override
  void sound() => print("Woof");
}

class Cat extends Animal {
  @override
  void sound() => print("Meow");
}

void main() {
  Animal a1 = Dog();
  Animal a2 = Cat();
  a1.sound();
  a2.sound();
}
