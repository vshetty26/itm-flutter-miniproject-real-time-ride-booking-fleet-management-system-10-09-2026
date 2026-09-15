class Counter {
  static int count = 0;

  Counter() {
    count++;
  }

  static void showCount() {
    print("Count: $count");
  }
}

void main() {
  Counter();
  Counter();
  Counter.showCount();
}
