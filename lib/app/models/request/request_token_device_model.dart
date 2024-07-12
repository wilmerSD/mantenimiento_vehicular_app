class RequestTokenDeviceModel {
  int idUsuario;
  String txtTokenUsuario;

  RequestTokenDeviceModel({
    required this.idUsuario,
    required this.txtTokenUsuario,
  });

  Map<String, dynamic> toJson() => {
        "idUser": idUsuario,
        "token": txtTokenUsuario,
      };
}
