class Car {
  String brand;
  String model;

  Car(this.brand, this.model);

  void display() {
    print("Brand: $brand, Model: $model");
  }
}

void main() {
  Car c1 = Car("Toyota", "Corolla");
  Car c2 = Car("Honda", "Civic");
  c1.display();
  c2.display();
}
