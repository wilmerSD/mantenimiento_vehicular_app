class RequestVacationSvgModel {
    String? codigo;
    String? perfil;
    String? inicio;
    String? fin;
    String? adelanto;

    RequestVacationSvgModel({
        this.codigo,
        this.perfil,
        this.inicio,
        this.fin,
        this.adelanto,
    });

    Map<String, dynamic> toJson() => {
        "codigo": codigo,
        "perfil": perfil,
        "inicio": inicio,
        "fin": fin,
        "adelanto": adelanto,
    };
}