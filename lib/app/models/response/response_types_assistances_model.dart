class ResponseTypesAssistancesModel {
  bool success;
  int statusCode;
  String statusMessage;
  List<DatumAssistances> data;

  ResponseTypesAssistancesModel({
    required this.success,
    required this.statusCode,
    required this.statusMessage,
    required this.data,
  });

  factory ResponseTypesAssistancesModel.fromJson(Map<String, dynamic> json) =>
      ResponseTypesAssistancesModel(
        success: json["success"],
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        data: List<DatumAssistances>.from(
            json["data"].map((x) => DatumAssistances.fromJson(x))),
      );
}

class DatumAssistances {
  int idTypesMarking;
  String description;

  DatumAssistances({
    required this.idTypesMarking,
    required this.description,
  });

  factory DatumAssistances.fromJson(Map<String, dynamic> json) =>
      DatumAssistances(
        idTypesMarking: json["idTypesMarking"],
        description: json["description"],
      );
}
