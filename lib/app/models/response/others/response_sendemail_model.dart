class ResponseSendEmailModel {
    bool? success;
    int? statusCode;
    String? statusMessage;
    List<String>? data;

    ResponseSendEmailModel({
        this.success,
        this.statusCode,
        this.statusMessage,
        this.data,
    });

    factory ResponseSendEmailModel.fromJson(Map<String, dynamic> json) => ResponseSendEmailModel(
        success: json["success"],
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        data: json["data"] == null ? [] : List<String>.from(json["data"]!.map((x) => x)),
    );

}