class Student {
  int rollNo;
  String name;
  double marks;

  Student(this.rollNo, this.name, this.marks);

  void display() {
    print("Roll No: $rollNo, Name: $name, Marks: $marks");
  }
}

void main() {
  Student s = Student(1, "Alice", 95.5);
  s.display();
}
