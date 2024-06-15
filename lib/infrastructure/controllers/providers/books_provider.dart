import 'package:riverpod/riverpod.dart';

import 'package:timetonic_books/domain/implementations/books_datasource_implementations.dart';

import 'package:timetonic_books/services/storage/key_value_storage_service.dart';
import 'package:timetonic_books/services/storage/key_value_storage_service_implementation.dart';

import '../../entites/book.dart';

final booksProvider = StateNotifierProvider<BooksNotifier, List<Book>>((ref) {
  final booksRepository = AllBooksImpl();
  final keyValueStorageService = KeyValueStorageServiceImpl();

  return BooksNotifier(
    booksRepository: booksRepository,
    keyValueStorageService: keyValueStorageService,
  );
});

class BooksNotifier extends StateNotifier<List<Book>> {
  final AllBooksImpl booksRepository;
  final KeyValueStorageService keyValueStorageService;

  BooksNotifier({
    required this.booksRepository,
    required this.keyValueStorageService,
  }) : super([]);

  Future<void> getAllBooks(String name, String sesskey) async {
    final books = await booksRepository.getAllBooks(name, sesskey);
    state = books;
    // Actualiza el estado con el nuevo estado del usuario.
    // No existe una propiedad `booksStatus` ni `notbooksenticated` en la lista de libros. Debes manejar este estado en otra parte de tu lógica de estado.
  }
}
