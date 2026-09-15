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
  Shape s1 = Circle();
  Shape s2 = Rectangle();
  s1.draw();
  s2.draw();
}
