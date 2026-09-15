void main() {
  int a = 10;
  int b = 20;
  int c = 30;

  if (a > b && a > c) {
    print("$a is the biggest number");
  } else if (b > a && b > c) {
    print("$b is the biggest number");
  } else {
    print("$c is the biggest number");
  }
}