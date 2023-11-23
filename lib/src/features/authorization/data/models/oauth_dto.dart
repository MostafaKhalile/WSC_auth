class OAuthDTO {
  OAuthDTO({
    required this.clientId,
    required this.username,
    required this.password,
    required this.scope,
    required this.grantType,
  });
  late final String clientId;
  late final String username;
  late final String password;
  late final String scope;
  late final String grantType;

  OAuthDTO.fromJson(Map<String, dynamic> json) {
    clientId = json['client_id'];
    username = json['username'];
    password = json['password'];
    scope = json['scope'];
    grantType = json['grant_type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['client_id'] = clientId;
    _data['username'] = username;
    _data['password'] = password;
    _data['scope'] = scope;
    _data['grant_type'] = grantType;
    return _data;
  }
}
