class ResponseScheduleByUser {
  bool success;
  int statusCode;
  String statusMessage;
  Data? data;

  ResponseScheduleByUser({
    required this.success,
    required this.statusCode,
    required this.statusMessage,
    required this.data,
  });

  factory ResponseScheduleByUser.fromJson(Map<String, dynamic> json) =>
      ResponseScheduleByUser(
        success: json["success"],
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  int? idHorarios;
  String? horaInicio;
  int? idRefrigerio;
  int? tiempoRefrigerio;
  String? horaInicioRefrigerio;
  String? horaFinRefrigerio;
  String? horaFin;
  int? idDescanso;
  String? descanso;
  String? diaExcepcion;
  String? hraInicioExcepcion;
  String? horaFinExcepcion;

  Data({
    this.idHorarios,
    this.horaInicio,
    this.idRefrigerio,
    this.tiempoRefrigerio,
    this.horaInicioRefrigerio,
    this.horaFinRefrigerio,
    this.horaFin,
    this.idDescanso,
    this.descanso,
    this.diaExcepcion,
    this.hraInicioExcepcion,
    this.horaFinExcepcion,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        idHorarios: json["IdHorarios"],
        horaInicio: json["HoraInicio"],
        idRefrigerio: json["idRefrigerio"],
        tiempoRefrigerio: json["tiempo"],
        horaInicioRefrigerio: json["horainicio"],
        horaFinRefrigerio: json["horafin"],
        horaFin: json["HoraFin"],
        idDescanso: json["IdDescanso"],
        descanso: json["Descanso"],
        diaExcepcion: json["dia_Excepcion"],
        hraInicioExcepcion: json["HoraInicio_Excepcion"],
        horaFinExcepcion: json["HoraFin_Excepcion"],
      );
}
