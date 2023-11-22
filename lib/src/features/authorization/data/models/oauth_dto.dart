class OAuthDTO {
  OAuthDTO({
    required this.grantType,
    required this.clientId,
    required this.clientSecret,
    required this.scope,
    required this.userName,
    required this.password,
  });
  late final String grantType;
  late final String clientId;
  late final String clientSecret;
  late final String scope;
  late final String userName;
  late final String password;

  OAuthDTO.fromJson(Map<String, dynamic> json) {
    grantType = json['grant_type'];
    clientId = json['client_id'];
    clientSecret = json['client_secret'];
    scope = json['Scope'];
    userName = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['grant_type'] = grantType;
    _data['client_id'] = clientId;
    _data['client_secret'] = clientSecret;
    _data['Scope'] = scope;
    _data['username'] = userName;
    _data['password'] = password;
    return _data;
  }
}
