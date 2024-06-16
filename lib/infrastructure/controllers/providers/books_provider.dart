import 'package:riverpod/riverpod.dart';

import 'package:timetonic_books/domain/implementations/books_datasource_implementations.dart';
import 'package:timetonic_books/infrastructure/controllers/providers/authentication_provider.dart';

import '../../entites/book.dart';
import '../../entites/user.dart';

final booksProvider = StateNotifierProvider<BooksNotifier, List<Book>>((ref) {
  final booksRepository = AllBooksImpl();
  final userData = ref.watch(authProvider).user!;

  return BooksNotifier(
    booksRepository: booksRepository,
    user: userData,
  );
});

class BooksNotifier extends StateNotifier<List<Book>> {
  final AllBooksImpl booksRepository;
  final User user;

  BooksNotifier({
    required this.booksRepository,
    required this.user,
  }) : super([]);

  Future<void> getAllBooks() async {
    final books =
        await booksRepository.getAllBooks(user.oauth.name, user.sesskey);
    state = books;
    // Actualiza el estado con el nuevo estado del usuario.
    // No existe una propiedad `booksStatus` ni `notbooksenticated` en la lista de libros. Debes manejar este estado en otra parte de tu lógica de estado.
  }
}
