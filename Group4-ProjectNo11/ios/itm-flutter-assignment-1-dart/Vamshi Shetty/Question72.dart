void main() {
  int a = 15;
  int b = 20;
  int x = a;
  int y = b;
  while (y != 0) {
    int temp = y;
    y = x % y;
    x = temp;
  }
  int gcd = x;
  int lcm = (a * b) ~/ gcd;
  print("LCM of $a and $b is $lcm");
}
