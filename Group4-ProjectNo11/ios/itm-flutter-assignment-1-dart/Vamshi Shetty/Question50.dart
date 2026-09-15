abstract class Worker {
  void work();
}

mixin Restable {
  void rest() {
    print("Resting");
  }
}

class Manager extends Worker with Restable {
  @override
  void work() {
    print("Managing work");
  }
}

void main() {
  Manager m = Manager();
  m.work();
  m.rest();
}
