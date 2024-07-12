class RequestEmailModel {
    int? idUser;
    int? idTypesMarking;
    String? validationOfMark;

    RequestEmailModel({
        this.idUser,
        this.idTypesMarking,
        this.validationOfMark,
    });

    Map<String, dynamic> toMap() => {
        "idUser": idUser,
        "idTypesMarking": idTypesMarking,
        "ValidationOfMark": validationOfMark,
    };
}