class Point {
  int x;
  int y;

  Point(this.x, this.y);
  Point.origin() : this(0, 0);
}

void main() {
  Point p = Point.origin();
  print("x: ${p.x}, y: ${p.y}");
}
