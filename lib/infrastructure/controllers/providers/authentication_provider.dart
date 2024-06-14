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

  void createAppKey() async {
    try {
      final appKey = await authRepository.getAppKey();

      final updatedUser = User(
        appKey: appKey,
        oauth: state.user?.oauth ?? Oauth(name: '', oauth: ''),
        sesskey: state.user?.sesskey ?? '',
      );

      _settLoggedUser(updatedUser);
    } on CustomError catch (e) {
      logout(errorMessage: "Error: No se creó al appkey");
      print(e.message);
    }
  }

  Future<void> loginUser(String name, String password, String appKey) async {
    try {
      final Oauth = await authRepository.getOauth(appKey, name, password);
      final updatedUser = User(
        appKey: state.user?.appKey ?? '',
        oauth: Oauth,
        sesskey: state.user?.sesskey ?? '',
      );

      _settLoggedUser(updatedUser);
    } on CustomError catch (e) {
      logout(errorMessage: e.message);
      print(e.message);
    } catch (e) {
      logout(errorMessage: 'Error desconocido ${e.toString()}');
      print(e);
    }
  }

  logout({String? errorMessage}) async {
    await keyValueStorageService.removeKey('sessKey');
    //todo: lIMPIAR sessKey
    state = state.copyWith(
        sessKey: null,
        user: null,
        userId: null,
        authStatus: AuthStatus.notAuthenticated,
        errorMessage: 'Sesión finalizada');
  }

  // void checkStatus() async {
  //   final sessKey = await keyValueStorageService.getValue<String>('sessKey');
//
  //   if (sessKey != null) {
  //     try {
  //       final user = await authRepository.checkAuthStatus(sessKey);
  //       _settLoggedUser(user);
  //       print("vv");
  //       print(user.sessKey);
  //     } on CustomError catch (e) {
  //       logout(errorMessage: e.message);
  //     } catch (e) {
  //       logout(errorMessage: 'Error desconocido ${e.toString()}');
  //     }
  //   }
  // }

  void _settLoggedUser(User user) async {
    //await keyValueStorageService.setKeyValue('sessKey', user.sesskey);

    // await keyValueStorageService.setKeyValue('sessKey', user.sessKey);
    //TODO: Necesito guardar el sessKey en storage
    state = state.copyWith(authStatus: AuthStatus.authenticated, user: user);
  }
}

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthState {
  final AuthStatus authStatus;
  final User? user;
  final String? sessKey;

  final String errorMessage;

  AuthState(
      {this.authStatus = AuthStatus.checking,
      this.user,
      this.sessKey,
      this.errorMessage = ''});

  AuthState copyWith({
    AuthStatus? authStatus,
    User? user,
    String? sessKey,
    String? userId,
    String? errorMessage,
  }) =>
      AuthState(
          authStatus: authStatus ?? this.authStatus,
          user: user ?? this.user,
          errorMessage: errorMessage ?? this.errorMessage,
          sessKey: sessKey ?? this.sessKey);
}
