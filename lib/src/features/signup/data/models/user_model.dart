import 'package:wsc_auth/src/features/signup/domain/entities/user.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 24/09/2023 at 14:12.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phone,
    required super.image,
    required super.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name']??'',
      email: json['email']??'',
      phone: json['phone']??'',
      image: json['image']??'',
      token: json['token']??'',
    );
  }

}
