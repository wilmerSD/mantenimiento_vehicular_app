class ResponseAddPermissionModel {
  bool success;
  int statusCode;
  String statusMessage;
  String data;

  ResponseAddPermissionModel({
    required this.success,
    required this.statusCode,
    required this.statusMessage,
    required this.data,
  });

  factory ResponseAddPermissionModel.fromJson(Map<String, dynamic> json) =>
      ResponseAddPermissionModel(
        success: json["success"],
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        data: json["data"],
      );
}
