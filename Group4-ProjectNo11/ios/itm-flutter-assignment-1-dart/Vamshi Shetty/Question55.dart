void main() {
  int num = 987654;
  int count = 0;
  int temp = num;
  do {
    count++;
    temp = temp ~/ 10;
  } while (temp > 0);
  print(count);
}
