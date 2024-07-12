class RequestVerifyCodeModel {
  String? code;
  int? idUser;

  RequestVerifyCodeModel({
    this.code,
    this.idUser,
  });

  Map<String, dynamic> toMap() => {
        "code": code,
        "id_user": idUser,
      };
}
