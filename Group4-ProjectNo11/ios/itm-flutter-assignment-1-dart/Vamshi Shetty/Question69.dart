abstract class Animal {
  void eat();
}

mixin Pet {
  void play() => print("Playing with owner");
}

class Dog extends Animal with Pet {
  @override
  void eat() => print("Dog is eating");
}

void main() {
  Dog d = Dog();
  d.eat();
  d.play();
}
