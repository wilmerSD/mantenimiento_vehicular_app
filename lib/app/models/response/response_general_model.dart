class ResponseGeneralModel {
  bool success;
  int? statusCode;
  String? statusMessage;
  String? data;

  ResponseGeneralModel({
    required this.success,
    this.statusCode,
    this.statusMessage,
    this.data,
  });

  factory ResponseGeneralModel.fromJson(Map<String, dynamic> json) =>
      ResponseGeneralModel(
        success: json["success"],
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        data: json["data"],
      );
}
