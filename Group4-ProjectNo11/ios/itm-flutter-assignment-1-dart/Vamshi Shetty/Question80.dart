mixin Resizable {
  void resize(double factor) {
    print("Resizing by factor: $factor");
  }
}

class Rectangle with Resizable {
  double width;
  double height;

  Rectangle(this.width, this.height);
}

void main() {
  Rectangle r = Rectangle(10, 5);
  r.resize(1.5);
}
