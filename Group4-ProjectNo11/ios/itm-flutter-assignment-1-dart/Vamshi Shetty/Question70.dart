class Person {
  int _age = 0;

  int get age => _age;
  set age(int value) {
    if (value >= 0 && value <= 120) {
      _age = value;
    } else {
      print("Invalid age");
    }
  }
}

void main() {
  Person p = Person();
  p.age = 25;
  print(p.age);
  p.age = -5;
  p.age = 130;
}
