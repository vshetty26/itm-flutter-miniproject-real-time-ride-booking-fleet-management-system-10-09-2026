class User {
  String _name = "";
  int _age = 0;

  String get name => _name;
  set name(String value) => _name = value;

  int get age => _age;
  set age(int value) => _age = value;
}

void main() {
  User u = User();
  u.name = "Bob";
  u.age = 30;
  print("Name: ${u.name}, Age: ${u.age}");
}
