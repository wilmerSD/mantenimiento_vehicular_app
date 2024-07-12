import 'package:app_valtx_asistencia/app/models/request/request_add_permission_model.dart';
import 'package:app_valtx_asistencia/app/models/request/request_justification_model.dart';
import 'package:app_valtx_asistencia/app/models/request/request_vacationsgv_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_add_permission_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_justification_model.dart';
import 'package:app_valtx_asistencia/app/models/response/sgv/response_indicatorsvacation_model.dart';
import 'package:app_valtx_asistencia/app/models/response/sgv/response_vacationsgv_model.dart';
import 'package:app_valtx_asistencia/core/network/dio_client.dart';
import 'package:get/get.dart';

class RegisterJustificationUserProvider {
  final _dioClient = Get.find<DioClient>();

  /* 📌 Registrar justificación */
  Future<ResponseJustificationModel> postRegisterJustification(
    RequestJustificationModel request,
  ) async {
    final response = await _dioClient.post(
      path: "/api/permissions/addJustifications",
      /* path: "/api/justifications/add", */
      bodyRaw: request.toMap(),
    );
    return ResponseJustificationModel.fromJson(response);
  } 

  /* 📌 Registrar permisos*/
  Future<ResponseAddPermissionModel> postRegisterPermission(
    RequestAddPermissionModel request,
  ) async {
    final response = await _dioClient.post(
      path: "/api/permissions/addPermissions",
      bodyRaw: request.toJson(),
    );
    return ResponseAddPermissionModel.fromJson(response);
  }

  /* 📌 Obtener indicadores vacacionales de sgv */
  Future<ResponseIndicatorsVacation> getIndicatorsSGV(
    String codigo,
  ) async {
    final response = await _dioClient.post(
      path: "/api/permissions/getholidayIndicators",
      bodyRaw: {"codigo": codigo},
    );
    return ResponseIndicatorsVacation.fromJson(response);
  }

  /* 📌 Registrar vacaciones en sgv */
  Future<ResponseVacationSgvModel> postRegisterVacations(
    RequestVacationSvgModel request,
  ) async {
    final response = await _dioClient.post(
      path: "/api/permissions/addVacations",
      bodyRaw: request.toJson(),
    );
    return ResponseVacationSgvModel.fromJson(response);
  }
}
