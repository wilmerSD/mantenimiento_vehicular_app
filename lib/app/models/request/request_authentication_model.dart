class RequestAuthenticationModel {
  RequestAuthenticationModel({
    required this.username,
    required this.password,
  });

  String username;
  String password;

  Map<String, dynamic> toMap() => {
        "username": username,
        "password": password,
      };
}
