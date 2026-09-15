void display(int x, [int? a, int? b]) {
  print("x: $x, a: $a, b: $b");
}

void main() {
  display(1);
  display(1, 2);
  display(1, 2, 3);
}
