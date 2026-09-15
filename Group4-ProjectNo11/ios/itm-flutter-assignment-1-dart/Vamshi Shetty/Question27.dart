int sumOfDigits(int num) {
  int sum = 0;
  while (num > 0) {
    sum += num % 10;
    num = num ~/ 10;
  }
  return sum;
}

void main() {
  print(sumOfDigits(1234));
}
