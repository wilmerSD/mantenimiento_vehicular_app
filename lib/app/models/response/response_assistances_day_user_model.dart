class ResponseAssistancesDayUserModel {
  bool success;
  int statusCode;
  String statusMessage;
  List<DatumDay>? data;

  ResponseAssistancesDayUserModel({
    required this.success,
    required this.statusCode,
    required this.statusMessage,
    this.data,
  });

  factory ResponseAssistancesDayUserModel.fromJson(Map<String, dynamic> json) =>
      ResponseAssistancesDayUserModel(
        success: json["success"] ?? '',
        statusCode: json["status_code"] ?? '',
        statusMessage: json["status_message"] ?? '',
        /* data: List<DatumDay>.from(json["data"].map((x) => DatumDay.fromJson(x))), */
        //data: json["data"] != null? List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))): null,
        data: (json["data"] != null &&
                json["data"] is Map &&
                json["data"].isEmpty)
            ? []
            : List<DatumDay>.from(
                json["data"].map((x) => DatumDay.fromJson(x))),
      );
}

class DatumDay {
  String? time;
  int? idTypesMarking;
  String? typesMarking;
  int? idValidation;
  String? validation;
  String? reason;

  DatumDay(
      {this.time,
      this.idTypesMarking,
      this.typesMarking,
      this.idValidation,
      this.validation,
      this.reason});

  factory DatumDay.fromJson(Map<String, dynamic> json) => DatumDay(
      time: json["time"],
      idTypesMarking: json["idTypesMarking"],
      typesMarking: json["typesMarking"],
      idValidation: json["idValidation"],
      validation: json["validation"],
      reason: json["reason"]);
}
