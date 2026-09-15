void display(int requiredPositional, {int? named1, int? named2}) {
  print("Positional: $requiredPositional, named1: $named1, named2: $named2");
}

void main() {
  display(10);
  display(10, named1: 20);
  display(10, named1: 20, named2: 30);
}
