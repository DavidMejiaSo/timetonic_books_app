import 'package:dio/dio.dart';
import 'package:timetonic_books/domain/datasource/books.dart';
import 'package:timetonic_books/infrastructure/entites/book.dart';
import 'package:timetonic_books/infrastructure/mappers/book_mapper.dart';

import '../../enviroment/enviroments.dart';

class AllBooksImpl extends AllBooksDatasource {
  final dio = Dio(BaseOptions(baseUrl: Environment.apiUrl));
  @override
  Future<List<Book>> getAllBooks(String userName, String sessKey) async {
    try {
      final response = await dio.post(
        "",
        queryParameters: {
          'version': Environment.apiVersion,
          'o_u': userName,
          'sesskey': sessKey,
          'req': Environment.apiReqGetBooks,
          'u_c': userName,
        },
      );

      final List<Book> books = [];
      final dataList = response.data?['allBooks']['books'] as List<dynamic>?;

      if (dataList != null) {
        final booksList = BooksMapper.jsonToEntityList(response.data);
        books.addAll(booksList);
      }

      return books;
    } catch (e) {
      // Maneja los errores adecuadamente
      throw Exception('Failed to get books');
    }
  }
}
