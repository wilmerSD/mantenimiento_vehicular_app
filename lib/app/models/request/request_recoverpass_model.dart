class RecoverPassModel {
    String? email;

    RecoverPassModel({
        this.email,
    });

    Map<String, dynamic> toMap() => {
        "email": email,
    };
}