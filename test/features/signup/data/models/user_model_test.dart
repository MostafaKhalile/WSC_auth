import 'package:flutter_test/flutter_test.dart';
import 'package:wsc_auth/src/features/signup/data/models/user_model.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 25/09/2023 at 11:18.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

const UserModel userModel = UserModel(
    id: 'id',
    name: 'name',
    email: 'email',
    phone: 'phone',
    image: 'image',
    token: 'token');

void main() {
  // test('Instance Of User', () async {
  //   // assert
  //   expect(
  //       userModel
  //       // Match the expected type to the actual type
  //       ,
  //       isA<UserModel>());
  // });

  group('fromJson', () {
    test('Valid Json', () async {
      // arrange
      Map<String, dynamic> userMap = {
        "id": 'id',
        "name": "name",
        "email": "email",
        "phone": "phone",
        "image": "image",
        "token": "token"
      };

      // act
      final result = UserModel.fromJson(userMap);

      // assert
      expect(
        result,
        // Match the expected type to the actual type
        userModel,
      );
    });
  });
}
