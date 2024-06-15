import 'package:dio/dio.dart';
import 'package:timetonic_books/domain/datasource/books.dart';
import 'package:timetonic_books/infrastructure/entites/book.dart';

import '../../enviroment/enviroments.dart';

class AllBooksImpl extends AllBooksDatasource {
  final dio = Dio(BaseOptions(baseUrl: Environment.apiUrl));
  @override
  Future<List<Book>> getAllBooks() async {
    try {
      final response = await dio.post(
        "",
        queryParameters: {
          'version': Environment.apiVersion,
          'req': Environment.apiReqAppKey,
          'appname': 'api',
        },
      );

      final String appKey = response.data['appkey'];
      final List<Book> lista = [];
      return lista;
    } catch (e) {
      // Handle errors appropriately

      throw Exception('Failed to get app key');
    }
    // TODO: implement getAllBooks
  }
}
