class ResponseAssistancesWeekUserModel {
  bool success;
  int statusCode;
  String statusMessage;
  List<DatumWeek>? data;

  ResponseAssistancesWeekUserModel({
    required this.success,
    required this.statusCode,
    required this.statusMessage,
    this.data,
  });

  factory ResponseAssistancesWeekUserModel.fromJson(
          Map<String, dynamic> json) =>
      ResponseAssistancesWeekUserModel(
        success: json["success"]??'',
        statusCode: json["status_code"]??'',
        statusMessage: json["status_message"]??'',
        /* data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))), */
        data: (json["data"] != null &&
                json["data"] is Map &&
                json["data"].isEmpty)
            ? []
            : List<DatumWeek>.from(
                json["data"].map((x) => DatumWeek.fromJson(x))),
      );
}

class DatumWeek {
  int? idUser;
  dynamic address;
  DateTime? date;
  String? day;
  dynamic time;
  int? idTypesMarking;
  int? idValidation;
  String? validation;

  DatumWeek({
    this.idUser,
    this.address,
    this.date,
    this.day,
    this.time,
    this.idTypesMarking,
    this.idValidation,
    this.validation,
  });

  factory DatumWeek.fromJson(Map<String, dynamic> json) => DatumWeek(
        idUser: json["idUser"],
        address: json["address"],
        date: DateTime.parse(json["date"]),
        day: json["day"],
        time: json["time"],
        idTypesMarking: json["idTypesMarking"],
        idValidation: json["idValidation"],
        validation: json["validation"],
      );
}
