void show({required int a, required int b}) {
  print("a: $a, b: $b");
}

void main() {
  show(a: 5, b: 10);
  show(b: 20, a: 15);
}
