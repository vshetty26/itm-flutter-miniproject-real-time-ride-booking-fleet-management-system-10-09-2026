mixin Logger {
  void log(String msg) {
    print("LOG: $msg");
  }
}

class Service with Logger {
  void doWork() {
    log("Work started");
  }
}

void main() {
  Service s = Service();
  s.doWork();
}
