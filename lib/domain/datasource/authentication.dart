import 'package:timetonic_books/infrastructure/entites/user.dart';

abstract class Authentication {
  Future<String> getAppKey();
  Future<Oauth> getOauth();
  Future<String> getSessKey();
}
