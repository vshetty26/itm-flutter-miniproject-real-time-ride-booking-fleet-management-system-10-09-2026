void main() {
  String char = 'A';
  switch (char.toLowerCase()) {
    case 'a':
    case 'e':
    case 'i':
    case 'o':
    case 'u':
      print("Vowel");
      break;
    default:
      print("Consonant");
  }
}
