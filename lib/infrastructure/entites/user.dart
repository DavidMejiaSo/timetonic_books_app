class Oauth {
  final String name;
  final String oauth;

  Oauth({required this.name, required this.oauth});
}

class User {
  //Los Twwets
  final String appKey;
  final Oauth oauth;

  final String sesskey;

  User({required this.appKey, required this.sesskey, required this.oauth});
}
