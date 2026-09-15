void show(int a, int b, [int? c]) {
  print("a: $a, b: $b, c: $c");
}

void main() {
  show(10, 20);
  show(10, 20, 30);
}
