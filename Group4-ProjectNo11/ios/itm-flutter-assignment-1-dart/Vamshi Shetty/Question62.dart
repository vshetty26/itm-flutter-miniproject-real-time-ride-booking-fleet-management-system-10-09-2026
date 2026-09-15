class Book {
  String title;
  String author;

  Book(this.title, this.author);

  @override
  String toString() {
    return "Book: '$title' by $author";
  }
}

void main() {
  Book b = Book("1984", "George Orwell");
  print(b);
}
