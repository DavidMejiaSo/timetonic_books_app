import 'package:riverpod/riverpod.dart';
import 'package:timetonic_books/domain/implementations/authentications_datasource_implementation.dart';

import '../../../domain/datasource/authentication.dart';
import '../../../services/errors/error.dart';
import '../../../services/storage/key_value_storage_service.dart';
import '../../../services/storage/key_value_storage_service_implementation.dart';
import '../../entites/user.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authRepository = AuthenticationImpl();
  final keyValueStorageService = KeyValueStorageServiceImpl();

  return AuthNotifier(
    authRepository: authRepository,
    keyValueStorageService: keyValueStorageService,
  );
});

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthenticationImpl authRepository;
  final KeyValueStorageService keyValueStorageService;
  AuthNotifier(
      {required this.authRepository, required this.keyValueStorageService})
      : super(AuthState()) {}

  Future<void> loginUser(String name, String password, String appKey) async {
    try {
      final user = await authRepository.getOauth(appKey, name, password);
      _settLoggedUser(user);
    } on CustomError catch (e) {
      logout(errorMessage: e.message);
    } catch (e) {
      logout(errorMessage: 'Error desconocido ${e.toString()}');
    }
  }

  logout({String? errorMessage}) async {
    await keyValueStorageService.removeKey('token');
    //todo: lIMPIAR TOKEN
    state = state.copyWith(
        token: null,
        user: null,
        userId: null,
        authStatus: AuthStatus.notAuthenticated,
        errorMessage: 'Sesión finalizada');
  }

  // void checkStatus() async {
  //   final token = await keyValueStorageService.getValue<String>('token');
//
  //   if (token != null) {
  //     try {
  //       final user = await authRepository.checkAuthStatus(token);
  //       _settLoggedUser(user);
  //       print("vv");
  //       print(user.token);
  //     } on CustomError catch (e) {
  //       logout(errorMessage: e.message);
  //     } catch (e) {
  //       logout(errorMessage: 'Error desconocido ${e.toString()}');
  //     }
  //   }
  // }

  void _settLoggedUser(Oauth user) async {
    await keyValueStorageService.setKeyValue('token', user.name);

    // await keyValueStorageService.setKeyValue('token', user.token);
    //TODO: Necesito guardar el token en storage
    state = state.copyWith(
        authStatus: AuthStatus.authenticated,
        errorMessage: 'Bienvenido ${user.name}');
  }
}

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthState {
  final AuthStatus authStatus;
  final User? user;
  final String? token;
  final String? userId;
  final String errorMessage;

  AuthState(
      {this.authStatus = AuthStatus.checking,
      this.user,
      this.token,
      this.userId,
      this.errorMessage = ''});

  AuthState copyWith({
    AuthStatus? authStatus,
    User? user,
    String? token,
    String? userId,
    String? errorMessage,
  }) =>
      AuthState(
          authStatus: authStatus ?? this.authStatus,
          user: user ?? this.user,
          userId: userId ?? this.userId,
          errorMessage: errorMessage ?? this.errorMessage,
          token: token ?? this.token);
}
