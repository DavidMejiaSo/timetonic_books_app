import 'package:timetonic_books/infrastructure/entites/user.dart';

abstract class Authentication {
  Future<String> getAppKey();
  Future<Oauth> getOauth(String appKey, String user, String password); //
  Future<String> getSessKey(String user, String oauthKey);
}
