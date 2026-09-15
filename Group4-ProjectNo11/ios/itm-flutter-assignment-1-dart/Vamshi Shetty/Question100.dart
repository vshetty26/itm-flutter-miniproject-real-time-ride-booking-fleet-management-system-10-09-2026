class Employee {
  String _name;
  double _salary;

  Employee(this._name, this._salary);

  String get name => _name;
  set name(String value) => _name = value;

  double get salary => _salary;
  set salary(double value) {
    if (value >= 0) {
      _salary = value;
    }
  }
}

void main() {
  Employee emp = Employee("John", 50000.0);
  print("Initial: ${emp.name}, ${emp.salary}");
  emp.name = "John Doe";
  emp.salary = 55000.0;
  print("Updated: ${emp.name}, ${emp.salary}");
}
