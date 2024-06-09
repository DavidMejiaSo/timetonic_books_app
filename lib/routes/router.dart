import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';
import 'package:timetonic_books/screens/initial_screen.dart';
import 'package:timetonic_books/screens/initial_screen.dart';
import 'package:timetonic_books/screens/login_screen.dart';

final goRouterProvider = StateProvider((ref) {
  //final goRouterNotifier = ref.read(goRouterNotifierProvider);

  return GoRouter(
    redirectLimit: 100,
    initialLocation: '/initialPage',
    //refreshListenable: goRouterNotifier,
    routes: [
      GoRoute(
        name: 'initial_page',
        path: '/initialPage',
        builder: (context, state) => const InitialScreen(),
      ),
      GoRoute(
        name: 'login_page',
        path: '/loginPage',
        builder: (context, state) => const LoginScreen(),
      )
    ],
  );
});
