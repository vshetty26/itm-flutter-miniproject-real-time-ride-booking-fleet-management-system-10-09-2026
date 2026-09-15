class A {
  A() {
    print("A constructor");
  }
}

class B extends A {
  B() {
    print("B constructor");
  }
}

class C extends B {
  C() {
    print("C constructor");
  }
}

void main() {
  C();
}
