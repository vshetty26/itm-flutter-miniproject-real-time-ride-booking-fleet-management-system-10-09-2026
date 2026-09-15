class BankAccount {
  double _balance = 0.0;

  double getBalance() {
    return _balance;
  }

  void setBalance(double balance) {
    if (balance >= 0) {
      _balance = balance;
    } else {
      print("Balance cannot be negative");
    }
  }
}

void main() {
  BankAccount account = BankAccount();
  account.setBalance(150.0);
  print(account.getBalance());
  account.setBalance(-50.0);
}
