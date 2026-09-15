class Shape {
  void draw() {
    print("Drawing shape");
  }
}

class Circle extends Shape {
  @override
  void draw() {
    print("Drawing circle");
  }
}

class Rectangle extends Shape {
  @override
  void draw() {
    print("Drawing rectangle");
  }
}

void main() {
  List<Shape> shapes = [Circle(), Rectangle()];
  for (var shape in shapes) {
    shape.draw();
  }
}
