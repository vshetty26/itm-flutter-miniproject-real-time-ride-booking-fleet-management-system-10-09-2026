int factorialIterative(int n) {
  int res = 1;
  for (int i = 1; i <= n; i++) {
    res *= i;
  }
  return res;
}

int factorialRecursive(int n) {
  if (n <= 1) return 1;
  return n * factorialRecursive(n - 1);
}

void main() {
  int n = 5;
  print("Iterative: ${factorialIterative(n)}");
  print("Recursive: ${factorialRecursive(n)}");
}
