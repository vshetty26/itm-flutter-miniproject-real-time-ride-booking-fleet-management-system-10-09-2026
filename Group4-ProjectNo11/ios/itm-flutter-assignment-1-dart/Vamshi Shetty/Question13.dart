void main() {
  int marks = 85;

  if (marks < 0 || marks > 100) {
    print("Invalid marks! Please enter a value between 0 and 100.");
  } else if (marks >= 90) {
    print("Grade: A");
  } else if (marks >= 75) {
    print("Grade: B");
  } else if (marks >= 60) {
    print("Grade: C");
  } else if (marks >= 45) {
    print("Grade: D");
  } else {
    print("Grade: F");
  }
}