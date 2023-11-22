import '../../domain/entities/access_token.dart';

class AccessTokenModel extends AccessToken {
  const AccessTokenModel({required super.accessToken});

  factory AccessTokenModel.fromJson(Map<String, dynamic> json) {
    return AccessTokenModel(accessToken: json['access_token']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['access_token'] = accessToken;
    return data;
  }
}
