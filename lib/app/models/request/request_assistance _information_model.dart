class RequestAssistanceInformationModel {
    int idUser;
    String date;

    RequestAssistanceInformationModel({
        required this.idUser,
        required this.date,
    });
    Map<String, dynamic>  toMap() => {
        "idUser": idUser,
        "date": date,
    };
}
