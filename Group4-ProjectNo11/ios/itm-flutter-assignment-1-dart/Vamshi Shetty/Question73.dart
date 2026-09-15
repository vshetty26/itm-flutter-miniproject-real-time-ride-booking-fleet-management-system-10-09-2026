bool isPalindrome(String s) {
  String clean = s.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '').toLowerCase();
  String reversed = clean.split('').reversed.join('');
  return clean == reversed;
}

void main() {
  print(isPalindrome("radar"));
  print(isPalindrome("hello"));
}
