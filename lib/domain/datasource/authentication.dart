abstract class Authentication {
  Future<String> getAppKey();
  Future<String> getOauth();
  Future<String> getSessKey();
}
