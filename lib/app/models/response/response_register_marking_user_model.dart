class ResponseRegisterMarkingUserModel {
  bool success;
  int statusCode;
  String statusMessage;
  DataMark data;

  ResponseRegisterMarkingUserModel({
    required this.success,
    required this.statusCode,
    required this.statusMessage,
    required this.data,
  });

  factory ResponseRegisterMarkingUserModel.fromJson(
          Map<String, dynamic> json) =>
      ResponseRegisterMarkingUserModel(
        success: json["success"],
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        data: (json["data"] != null && json["data"].isEmpty)
            ? DataMark()
            : DataMark.fromJson(json["data"]),
      );
}

class DataMark {
  int? idTipoValidacion;
  int? idMostrarForm;
  String? registradoComo;
  String? detalle;

  DataMark({
    this.idTipoValidacion,
    this.idMostrarForm,
    this.registradoComo,
    this.detalle,
  });

  factory DataMark.fromJson(Map<String, dynamic> json) => DataMark(
        idTipoValidacion: json["idTipoValidacion"] ?? 0,
        idMostrarForm: json["idMostrarForm"] ?? 0,
        registradoComo: json["Registrado como"] ?? '',
        detalle: json["Detalle"],
      );
}
