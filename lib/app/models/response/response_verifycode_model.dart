class ResponseVerifyCodeModel {
    bool success;
    int? statusCode;
    String? statusMessage;
    String? data;

    ResponseVerifyCodeModel({
        required this.success,
        this.statusCode,
        this.statusMessage,
        this.data,
    });

    factory ResponseVerifyCodeModel.fromJson(Map<String, dynamic> json) => ResponseVerifyCodeModel(
        success: json["success"],
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        data: json["data"],
    );
}