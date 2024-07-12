class RequestIdUserModel {
    int idUser;

    RequestIdUserModel({
        required this.idUser,
    });

    Map<String, dynamic> toMap() => {
        "idUser": idUser,
    };
}
