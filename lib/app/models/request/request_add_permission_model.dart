class RequestAddPermissionModel {
  int idUser;
  int idRole;
  String datePermission;
  String reason;

  RequestAddPermissionModel({
    required this.idUser,
    required this.idRole,
    required this.datePermission,
    required this.reason,
  });

  Map<String, dynamic> toJson() => {
        "idUser": idUser,
        "idRole": idRole,
        "datePermission": datePermission,
        "reason": reason,
      };
}
