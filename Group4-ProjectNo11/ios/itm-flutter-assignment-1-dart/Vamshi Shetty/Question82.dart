import 'dart:io';

void main() {
  int rows = 5;
  for (int i = 0; i < rows; i++) {
    for (int k = 0; k < rows - i; k++) {
      stdout.write(" ");
    }
    int val = 1;
    for (int j = 0; j <= i; j++) {
      stdout.write("$val ");
      val = val * (i - j) ~/ (j + 1);
    }
    stdout.writeln();
  }
}
