class Point {
  int x;
  int y;

  Point(this.x, this.y);

  factory Point.copy(Point other) {
    return Point(other.x, other.y);
  }
}

void main() {
  Point p1 = Point(3, 4);
  Point p2 = Point.copy(p1);
  print("p2: ${p2.x}, ${p2.y}");
}
