class RequestScheduleByUser {
  String idUser;

  RequestScheduleByUser({
    required this.idUser,
  });

  Map<String, dynamic> toJson() => {
        "idUser": idUser,
      };
}
