import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';
import 'package:timetonic_books/screens/initial_description_screen.dart';
import 'package:timetonic_books/screens/initial_screen.dart';

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
        name: 'description_page',
        path: '/descriptionPage',
        builder: (context, state) => const DescriptionScreen(),
      )
    ],
  );
});