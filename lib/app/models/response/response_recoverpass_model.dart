class ResponseRecoverPassModel {
    bool success;
    int? statusCode;
    String? statusMessage;
    String? data;

    ResponseRecoverPassModel({
        required this.success,
        this.statusCode,
        this.statusMessage,
        this.data,
    });

    factory ResponseRecoverPassModel.fromJson(Map<String, dynamic> json) => ResponseRecoverPassModel(
        success: json["success"],
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        data: json["data"],
    );
}