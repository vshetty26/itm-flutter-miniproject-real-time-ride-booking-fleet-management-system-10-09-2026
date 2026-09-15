class Point {
  int x;
  int y;

  Point() : x = 0, y = 0;
  Point.parameterized(this.x, this.y);
}

void main() {
  Point p1 = Point();
  Point p2 = Point.parameterized(5, 10);
  print("p1: ${p1.x}, ${p1.y}");
  print("p2: ${p2.x}, ${p2.y}");
}
