import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';
import 'package:timetonic_books/infrastructure/controllers/providers/authentication_provider.dart';
import 'package:timetonic_books/screens/initial_screen.dart';
import 'package:timetonic_books/screens/initial_screen.dart';
import 'package:timetonic_books/screens/login_screen.dart';

import '../screens/landing_page.dart';

final goRouterProvider = StateProvider((ref) {
  final user = ref.watch(authProvider);
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
      ),
      GoRoute(
        name: 'landing_page',
        path: '/landingPage',
        builder: (context, state) => const LandingScreen(),
      )
    ],

    redirect: (context, state) {
      // final authStatus = user.authStatus;

      //  if (authStatus == AuthStatus.notAuthenticated) {
      //    if (state.fullPath == "/loginPage") return null;
      //    return '/loginPage';
      //  }

      //  if (authStatus == AuthStatus.authenticated) {
      //    if (state.fullPath == '/loginPage') {
      //      return '/landingPage';
      //    }
      //  }
      //  return null;
    },
  );
});
