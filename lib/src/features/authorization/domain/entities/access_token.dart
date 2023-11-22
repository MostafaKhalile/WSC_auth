// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class AccessToken extends Equatable {
  const AccessToken({
    required this.accessToken,
  });
  final String accessToken;

  @override
  List<Object?> get props => [accessToken];
}
