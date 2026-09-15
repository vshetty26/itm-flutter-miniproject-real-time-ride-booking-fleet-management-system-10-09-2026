class Container {
  final int id;
  Container(this.id);

  void display() {
    print("ID: $id");
  }
}

void main() {
  Container c = Container(101);
  c.display();
}
