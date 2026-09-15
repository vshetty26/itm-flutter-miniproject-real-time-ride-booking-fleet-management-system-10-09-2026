class Configuration {
  static String mode = "DEBUG";

  static void showConfig() {
    print("Mode: $mode");
  }
}

void main() {
  Configuration.showConfig();
}
