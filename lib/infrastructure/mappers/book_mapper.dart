import '../../enviroment/enviroments.dart';
import '../entites/book.dart';

class BooksMapper {
  static List<Book> jsonToEntityList(Map<String, dynamic>? json) {
    final dataList = json?['allBooks']['books'] as List<dynamic>?;
    final apiUrl = Environment.url;
    final List<Book> books = [];

    if (dataList != null) {
      for (final item in dataList) {
        final title = item['ownerPrefs']['title']?.toString() ?? 'Sin título';
        final coverUrl = item['ownerPrefs']['oCoverImg']?.toString() ?? '';
        final description =
            item['description']?.toString() ?? 'Sin descripción';

        final book = Book(
          description: description,
          cover_url: '$apiUrl$coverUrl',
          title: title,
        );
        books.add(book);
      }
    }

    return books;
  }
}
