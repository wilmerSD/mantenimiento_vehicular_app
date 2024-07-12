class ResponseVacationSgvModel {
  bool success;
  int? statusCode;
  String? statusMessage;
  /* DataSvg? data; */
  /* ResultadoRegistro? resultadoRegistro; */
  final data;

  ResponseVacationSgvModel({
    required this.success,
    this.statusCode,
    this.statusMessage,
    this.data,
  });

  factory ResponseVacationSgvModel.fromJson(Map<String, dynamic> json) {
    if (json["success"] == false) {
      return ResponseVacationSgvModel(
        success: json["success"],
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        data: DataSvg.fromJson(json["data"]),
      );
    } else {
      return ResponseVacationSgvModel(
        success: json["success"],
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        data:  ResultadoRegistro.fromJson( json["data"]["resultadoRegistro"]),
      );
    }
  }
}

class DataSvg {
  String? codigo;
  String? excepcion;
  String? descripcion;

  DataSvg({
    this.codigo,
    this.excepcion,
    this.descripcion,
  });

  factory DataSvg.fromJson(Map<String, dynamic> json) => DataSvg(
        codigo: json["Codigo"],
        excepcion: json["Excepcion"],
        descripcion: json["Descripcion"],
      );
}

class ResultadoRegistro {
    dynamic errores;
    String? estado;
    String? mensaje;

    ResultadoRegistro({
        this.errores,
        this.estado,
        this.mensaje,
    });

    factory ResultadoRegistro.fromJson(Map<String, dynamic> json) => ResultadoRegistro(
        errores: json["errores"],
        estado: json["estado"],
        mensaje: json["mensaje"],
    );
}