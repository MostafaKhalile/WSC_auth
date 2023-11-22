class OAuthDTO {
  OAuthDTO({
    required this.grantType,
    required this.clientId,
    required this.clientSecret,
    required this.scope,
  });
  late final String grantType;
  late final String clientId;
  late final String clientSecret;
  late final String scope;

  OAuthDTO.fromJson(Map<String, dynamic> json) {
    grantType = json['grant_type'];
    clientId = json['client_id'];
    clientSecret = json['client_secret'];
    scope = json['Scope'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['grant_type'] = grantType;
    _data['client_id'] = clientId;
    _data['client_secret'] = clientSecret;
    _data['Scope'] = scope;
    return _data;
  }
}
