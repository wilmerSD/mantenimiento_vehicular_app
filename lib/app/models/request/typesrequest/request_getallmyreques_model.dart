class RequestGetAllMyRequestModel {
    int? idUser;
    int? typeRequest;
    int? stateInProgress;
    int? stateApprovedByLeader;
    int? stateRejectedByLeader;
    int? stateInProgressRrhh;
    int? stateAprovedByRrhh;
    int? stateRejectedByRrhh;
    int? page;

    RequestGetAllMyRequestModel({
        this.idUser,
        this.typeRequest,
        this.stateInProgress,
        this.stateApprovedByLeader,
        this.stateRejectedByLeader,
        this.stateInProgressRrhh,
        this.stateAprovedByRrhh,
        this.stateRejectedByRrhh,
        this.page,
    });

    Map<String, dynamic> toMap() => {
        "idUser": idUser,
        "typeRequest": typeRequest,
        "stateInProgress": stateInProgress,
        "stateApprovedByLeader": stateApprovedByLeader,
        "stateRejectedByLeader": stateRejectedByLeader,
        "stateInProgressRRHH": stateInProgressRrhh,
        "stateAprovedByRRHH": stateAprovedByRrhh,
        "stateRejectedByRRHH": stateRejectedByRrhh,
        "page": page,
    };
}