void main() {
  int n = 10;
  int t1 = 0, t2 = 1;
  for (int i = 1; i <= n; i++) {
    print(t1);
    int sum = t1 + t2;
    t1 = t2;
    t2 = sum;
  }
}
