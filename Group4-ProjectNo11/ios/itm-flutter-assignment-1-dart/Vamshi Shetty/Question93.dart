class SecureData {
  String _readOnly = "Secret Info";
  String _writeOnly = "";

  String get readOnly => _readOnly;

  set writeOnly(String value) {
    _writeOnly = value;
    print("Value updated to: $_writeOnly");
  }
}

void main() {
  SecureData data = SecureData();
  print(data.readOnly);
  data.writeOnly = "New Data";
}
