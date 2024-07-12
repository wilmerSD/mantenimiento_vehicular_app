class ResponseJustificationModel{
    bool success;
    int statusCode;
    String statusMessage;
    String data;

    ResponseJustificationModel({
        required this.success,
        required this.statusCode,
        required this.statusMessage,
        required this.data,
    });

    factory ResponseJustificationModel.fromJson(Map<String, dynamic> json) => ResponseJustificationModel(
        success: json["success"],
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        data: json["data"],
    );
}