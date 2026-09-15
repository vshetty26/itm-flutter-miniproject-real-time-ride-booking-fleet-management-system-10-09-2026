bool isPalindrome(int num) {
  int original = num;
  int reversed = 0;
  while (num > 0) {
    int digit = num % 10;
    reversed = reversed * 10 + digit;
    num = num ~/ 10;
  }
  return original == reversed;
}

void main() {
  int num = 121;
  print(isPalindrome(num));
}
