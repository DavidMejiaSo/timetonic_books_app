import 'package:dio/dio.dart';
import 'package:timetonic_books/domain/datasource/authentication.dart';
import 'package:timetonic_books/infrastructure/entites/user.dart';

import '../../enviroment/enviroments.dart';

class AuthenticationImpl extends Authentication {
  final dio = Dio(BaseOptions(baseUrl: Environment.apiUrl));
  @override
  Future<String> getAppKey() async {
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

      return appKey;
    } catch (e) {
      // Handle errors appropriately

      throw Exception('Failed to get app key');
    }
  }

  @override
  Future<Oauth> getOauth(String appKey, String user, String password) async {
    // TODO: implement getOauth
    try {
      final response = await dio.post(
        "",
        queryParameters: {
          'version': Environment.apiVersion,
          'req': Environment.apiReqOAuth,
          'login': user,
          'pwd': password,
          'appkey': appKey,
        },
      );
      String oauth = response.data['oauthkey'];
      String name = response.data['o_u'];
      print("Este es el name $name y este es el nombre $oauth");
      return Oauth(name: name, oauth: oauth);
    } catch (e) {
      // Handle errors appropriately

      throw Exception('Failed to get app key');
    }
  }

  @override
  Future<String> getSessKey(String user, String oauthKey) async {
    try {
      final response = await dio.post(
        "",
        queryParameters: {
          'version': Environment.apiVersion,
          'req': Environment.apiReqSessKey,
          'o_u': user,
          'oauthkey': oauthKey,
        },
      );

      String sessKey = response.data['sesskey'];

      return sessKey;
    } catch (e) {
      // Handle errors appropriately

      throw Exception('Failed to get app key');
    }
    // TODO: implement getSessKey
  }
}
