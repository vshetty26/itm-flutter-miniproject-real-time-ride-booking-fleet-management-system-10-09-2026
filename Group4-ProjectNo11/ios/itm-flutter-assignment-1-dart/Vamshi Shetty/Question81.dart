bool isAnagram(String s1, String s2) {
  if (s1.length != s2.length) return false;
  List<String> l1 = s1.split('')..sort();
  List<String> l2 = s2.split('')..sort();
  return l1.join('') == l2.join('');
}

void main() {
  print(isAnagram("listen", "silent"));
  print(isAnagram("hello", "world"));
}
