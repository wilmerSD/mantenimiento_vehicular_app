class ResponseIndicatorsVacation {
    bool success;
    int? statusCode;
    String? statusMessage;
    DataIndicators? data;

    ResponseIndicatorsVacation({
        required this.success,
        this.statusCode,
        this.statusMessage,
        this.data,
    });

    factory ResponseIndicatorsVacation.fromJson(Map<String, dynamic> json) => ResponseIndicatorsVacation(
        success: json["success"],
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        data: json["data"] == null ? null : DataIndicators.fromJson(json["data"]),
    );
}

class DataIndicators {
    Indicador? indicador;

    DataIndicators({
        this.indicador,
    });

    factory DataIndicators.fromJson(Map<String, dynamic> json) => DataIndicators(
        indicador: json["Indicador"] == null ? null : Indicador.fromJson(json["Indicador"]),
    );

}

class Indicador {
    String? empleadoCip;
    int? diasTruncos;
    int? diasPendientes;
    int? diasVencidos;
    String? fechaDerecho;

    Indicador({
        this.empleadoCip,
        this.diasTruncos,
        this.diasPendientes,
        this.diasVencidos,
        this.fechaDerecho,
    });

    factory Indicador.fromJson(Map<String, dynamic> json) => Indicador(
        empleadoCip: json["EmpleadoCIP"],
        diasTruncos: json["DiasTruncos"],
        diasPendientes: json["DiasPendientes"],
        diasVencidos: json["DiasVencidos"],
        fechaDerecho: json["FechaDerecho"],
    );
}