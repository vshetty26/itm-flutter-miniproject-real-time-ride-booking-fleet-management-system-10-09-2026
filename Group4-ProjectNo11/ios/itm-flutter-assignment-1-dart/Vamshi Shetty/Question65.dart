abstract class Bird {
  void fly() {
    print("Flying high");
  }
  void makeSound();
}

class Parrot extends Bird {
  @override
  void makeSound() {
    print("Squawk");
  }
}

void main() {
  Parrot p = Parrot();
  p.fly();
  p.makeSound();
}
