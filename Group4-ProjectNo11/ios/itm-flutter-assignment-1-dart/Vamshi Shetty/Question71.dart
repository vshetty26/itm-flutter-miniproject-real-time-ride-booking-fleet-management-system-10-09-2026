import 'dart:io';

void main() {
  int rows = 5;
  int number = 1;
  for (int i = 1; i <= rows; i++) {
    for (int j = 1; j <= i; j++) {
      stdout.write("$number ");
      number++;
    }
    stdout.writeln();
  }
}
