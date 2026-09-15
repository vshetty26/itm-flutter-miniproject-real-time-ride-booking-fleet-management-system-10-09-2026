int countVowels(String s) {
  int count = 0;
  var vowels = Set.from(['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U']);
  for (int i = 0; i < s.length; i++) {
    if (vowels.contains(s[i])) {
      count++;
    }
  }
  return count;
}

void main() {
  print(countVowels("Hello World"));
}
