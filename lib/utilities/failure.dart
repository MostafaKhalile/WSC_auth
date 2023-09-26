/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 20/09/2023 at 12:43.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

abstract class CustomException {
  final String? message;
  final int? code;

  const CustomException({this.code, this.message});
}

class ServerFailure extends CustomException {
  const ServerFailure({String? message, int? code})
      : super(
          message: message,
          code: code,
        );
}
