abstract class Drawable {
  void draw();
}

class Circle implements Drawable {
  @override
  void draw() {
    print("Draw circle");
  }
}

class Square implements Drawable {
  @override
  void draw() {
    print("Draw square");
  }
}

void main() {
  Drawable d1 = Circle();
  Drawable d2 = Square();
  d1.draw();
  d2.draw();
}
