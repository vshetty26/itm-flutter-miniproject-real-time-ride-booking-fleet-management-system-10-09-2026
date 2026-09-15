class Animal {}
class Dog extends Animal {}

void main() {
  Object a = Dog();
  if (a is Dog) {
    print("It's a Dog");
  }
  if (a is Animal) {
    print("It's also an Animal");
  }
}
