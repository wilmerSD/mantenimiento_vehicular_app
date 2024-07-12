class RequestUserInformationModel {
    String username;
    String password;

    RequestUserInformationModel({
        required this.username,
        required this.password,
    });

    Map<String, dynamic> toMap() => {
        "username": username,
        "password": password,
    };
}
