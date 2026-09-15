void configure({String host = "localhost", int port = 8080}) {
  print("Host: $host, Port: $port");
}

void main() {
  configure();
  configure(host: "127.0.0.1", port: 9000);
}
