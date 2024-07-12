class RequestJustificationModel {
    int idUser;
    int idTypeMark;
    String reason;

    RequestJustificationModel({
        required this.idUser,
        required this.idTypeMark,
        required this.reason,
    });

    Map<String, dynamic> toMap() => {
        "idUser": idUser,
        "idTypeMark": idTypeMark,
        "reason": reason,
    };
}