class ResponseGetAllMyRequestModel {
    bool? success;
    int? statusCode;
    int? count;
    List<DatumGetAllMyRequest>? data;
    int? pageCount;
    int? pageIndex;
    int? pageSize;

    ResponseGetAllMyRequestModel({
        this.success,
        this.statusCode,
        this.count,
        this.data,
        this.pageCount,
        this.pageIndex,
        this.pageSize,
    });

    factory ResponseGetAllMyRequestModel.fromJson(Map<String, dynamic> json) => ResponseGetAllMyRequestModel(
        success: json["success"],
        statusCode: json["status_code"],
        count: json["count"],
        data: json["data"] == null ? [] : List<DatumGetAllMyRequest>.from(json["data"]!.map((x) => DatumGetAllMyRequest.fromJson(x))),
        pageCount: json["pageCount"],
        pageIndex: json["pageIndex"],
        pageSize: json["pageSize"],
    );

}

class DatumGetAllMyRequest {
    int? id;
    int? idTipoSolicitud;
    int? idUsuario;
    DateTime? fecha;
    String? fechaPermiso;
    String? fechaDesde;
    String? fechaHasta;
    int? idTMarcaciones;
    String? motivo;
    int? estadoSolicitudF;
    int? estadoSolicitudS;
    int? updatedByF;
    int? updatedByS;
    dynamic tiempoPermiso;
    String? descripcionTipoSolicitud;
    String? descripcionEstadoSolicitud;
    String? descripcionTipoMarcacion;

    DatumGetAllMyRequest({
        this.id,
        this.idTipoSolicitud,
        this.idUsuario,
        this.fecha,
        this.fechaPermiso,
        this.fechaDesde,
        this.fechaHasta,
        this.idTMarcaciones,
        this.motivo,
        this.estadoSolicitudF,
        this.estadoSolicitudS,
        this.updatedByF,
        this.updatedByS,
        this.tiempoPermiso,
        this.descripcionTipoSolicitud,
        this.descripcionEstadoSolicitud,
        this.descripcionTipoMarcacion,
    });

    factory DatumGetAllMyRequest.fromJson(Map<String, dynamic> json) => DatumGetAllMyRequest(
        id: json["id"],
        idTipoSolicitud: json["idTipoSolicitud"],
        idUsuario: json["idUsuario"],
        fecha: json["Fecha"] == null ? null : DateTime.parse(json["Fecha"]),
        fechaPermiso: json["FechaPermiso"],
        fechaDesde: json["FechaDesde"],
        fechaHasta: json["FechaHasta"],
        idTMarcaciones: json["idTMarcaciones"],
        motivo: json["Motivo"],
        estadoSolicitudF: json["estadoSolicitudF"],
        estadoSolicitudS: json["estadoSolicitudS"],
        updatedByF: json["Updated_byF"],
        updatedByS: json["Updated_byS"],
        tiempoPermiso: json["tiempoPermiso"],
        descripcionTipoSolicitud: json["descripcionTipoSolicitud"],
        descripcionEstadoSolicitud: json["descripcionEstadoSolicitud"],
        descripcionTipoMarcacion: json["descripcionTipoMarcacion"],
    );

}
