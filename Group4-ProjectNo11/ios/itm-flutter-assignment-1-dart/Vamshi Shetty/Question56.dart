import 'dart:math';

void main() {
  for (int i = 1; i <= 1000; i++) {
    int temp = i;
    int sum = 0;
    int digits = i.toString().length;
    while (temp > 0) {
      int digit = temp % 10;
      sum += pow(digit, digits).toInt();
      temp = temp ~/ 10;
    }
    if (sum == i) {
      print(i);
    }
  }
}
