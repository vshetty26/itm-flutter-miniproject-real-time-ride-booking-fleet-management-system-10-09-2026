abstract class Shape {
  void draw();
}

class Circle extends Shape {
  @override
  void draw() => print("Circle");
}

class Square extends Shape {
  @override
  void draw() => print("Square");
}

void main() {
  List<Shape> shapes = [Circle(), Square()];
  for (var shape in shapes) {
    shape.draw();
  }
}
