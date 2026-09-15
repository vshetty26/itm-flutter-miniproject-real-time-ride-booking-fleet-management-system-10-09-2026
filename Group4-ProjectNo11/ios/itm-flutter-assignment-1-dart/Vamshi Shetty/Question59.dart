class Rectangle {
  double length;
  double width;

  Rectangle(this.length, this.width);

  double area() => length * width;
  double perimeter() => 2 * (length + width);
}

void main() {
  Rectangle r = Rectangle(10.0, 5.0);
  print("Area: ${r.area()}");
  print("Perimeter: ${r.perimeter()}");
}
