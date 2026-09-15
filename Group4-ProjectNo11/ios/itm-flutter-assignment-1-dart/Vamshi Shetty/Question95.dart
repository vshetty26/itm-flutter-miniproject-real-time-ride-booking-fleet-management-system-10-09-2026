class Food {}
class Fruit extends Food {}

abstract class Animal {
  Food getFood();
}

class Monkey extends Animal {
  @override
  Fruit getFood() => Fruit();
}

void main() {
  Monkey m = Monkey();
  Fruit f = m.getFood();
  print(f);
}
