class RequestAddVacationsModel {
  int idUser;
  int idRole;
  String dateStart;
  String dateEnd;
  String reason;

  RequestAddVacationsModel({
    required this.idUser,
    required this.idRole,
    required this.dateStart,
    required this.dateEnd,
    required this.reason,
  });

  Map<String, dynamic> toJson() => {
        "idUser": idUser,
        "idRole": idRole,
        "dateStart": dateStart,
        "dateEnd": dateEnd,
        "reason": reason,
      };
}
