class RequestChangePassModel {
  int? idUser;
  String? password;

  RequestChangePassModel({
    this.idUser,
    this.password,
  });

  Map<String, dynamic> toMap() => {
        "idUser": idUser,
        "password": password,
      };
}
