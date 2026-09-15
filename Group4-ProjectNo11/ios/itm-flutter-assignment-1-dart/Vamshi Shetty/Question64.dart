class Size {
  double width;
  double height;

  Size() : width = 0.0, height = 0.0;
  Size.square(double side) : width = side, height = side;
}

void main() {
  Size s1 = Size();
  Size s2 = Size.square(10);
  print("s1: ${s1.width}x${s1.height}");
  print("s2: ${s2.width}x${s2.height}");
}
