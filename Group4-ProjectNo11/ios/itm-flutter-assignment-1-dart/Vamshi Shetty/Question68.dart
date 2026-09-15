mixin Flyable {
  void fly() => print("Flying");
}

mixin Eatable {
  void eat() => print("Eating");
}

class Pegasus with Flyable, Eatable {}

void main() {
  Pegasus p = Pegasus();
  p.fly();
  p.eat();
}
