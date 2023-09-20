class SignupParams {
  final String email;
  final String password;
  final String name;

  SignupParams({
    required this.email,
    required this.password,
    required this.name,
  });

  toJson() => {
        'email': email,
        'password': password,
        'name': name,
      };

  factory SignupParams.fromJson(Map<String, dynamic> json) => SignupParams(
        email: json['email'],
        password: json['password'],
        name: json['name'],
      );
}
