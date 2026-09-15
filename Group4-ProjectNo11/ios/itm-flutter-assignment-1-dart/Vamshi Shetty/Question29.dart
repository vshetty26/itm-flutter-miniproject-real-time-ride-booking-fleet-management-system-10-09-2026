class Box {
  double length;
  double breadth;
  double height;

  Box(this.length, this.breadth, this.height);

  double volume() {
    return length * breadth * height;
  }
}

void main() {
  Box b = Box(10, 5, 2);
  print(b.volume());
}
