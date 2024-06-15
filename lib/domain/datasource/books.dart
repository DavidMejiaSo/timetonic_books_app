import 'package:timetonic_books/infrastructure/entites/book.dart';

abstract class AllBooksDatasource {
  Future<List<Book>> getAllBooks(String user_name, String sessKey);
}
