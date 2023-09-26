abstract class SignupParamsInterface {

  String? email;
  String? phone;
  String password;
  String name;

  SignupParamsInterface(
      {required email, required this.password, required this.name, required this.phone,})
      :assert(
  email != null || phone != null
  );


  Map<String, dynamic> toJson();

}
