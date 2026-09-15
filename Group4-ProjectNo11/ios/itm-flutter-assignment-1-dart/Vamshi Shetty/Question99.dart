abstract class Serializable {}

class Product implements Serializable {
  String name;
  Product(this.name);
}

void main() {
  Object p = Product("Laptop");
  if (p is Serializable) {
    print("Product is serializable");
  }
}
