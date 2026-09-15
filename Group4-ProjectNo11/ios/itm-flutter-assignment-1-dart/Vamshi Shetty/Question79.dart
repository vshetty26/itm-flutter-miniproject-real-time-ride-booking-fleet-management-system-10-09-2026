abstract class Shape {
  double area();
  double volume();
}

class Cube extends Shape {
  double side;
  Cube(this.side);

  @override
  double area() => 6 * side * side;

  @override
  double volume() => side * side * side;
}

void main() {
  Cube c = Cube(3);
  print("Area: ${c.area()}");
  print("Volume: ${c.volume()}");
}
