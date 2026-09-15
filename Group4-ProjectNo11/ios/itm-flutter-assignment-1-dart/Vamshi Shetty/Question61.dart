class Employee {
  String name;
  double salary;

  Employee(this.name, this.salary);
}

class Manager extends Employee {
  double bonus;

  Manager(String name, double salary, this.bonus) : super(name, salary);

  double get totalSalary => salary + bonus;
}

void main() {
  Manager m = Manager("Alice", 50000, 10000);
  print("Total Salary: ${m.totalSalary}");
}
