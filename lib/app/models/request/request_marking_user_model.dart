class RequestMarkingUserModel {
    int idUser;
    int idTypesMarking;
    double latitude;
    double longitude;
    String address;

    RequestMarkingUserModel({
        required this.idUser,
        required this.idTypesMarking,
        required this.latitude,
        required this.longitude,
        required this.address,
    });

    Map<String, dynamic> toMap() => {
        "idUser": idUser,
        "idTypesMarking": idTypesMarking,
        "latitude": latitude,
        "longitude": longitude,
        "address": address,
    };
}