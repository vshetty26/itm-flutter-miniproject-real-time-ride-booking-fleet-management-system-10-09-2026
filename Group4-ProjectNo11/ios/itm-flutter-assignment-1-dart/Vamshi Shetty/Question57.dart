bool isPerfect(int n) {
  int sum = 0;
  for (int i = 1; i <= n ~/ 2; i++) {
    if (n % i == 0) {
      sum += i;
    }
  }
  return sum == n;
}

void main() {
  print(isPerfect(6));
  print(isPerfect(28));
  print(isPerfect(12));
}
