import 'package:app_valtx_asistencia/app/models/request/request_add_permission_model.dart';
import 'package:app_valtx_asistencia/app/models/request/request_justification_model.dart';
import 'package:app_valtx_asistencia/app/models/request/request_vacationsgv_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_add_permission_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_justification_model.dart';
import 'package:app_valtx_asistencia/app/models/response/sgv/response_indicatorsvacation_model.dart';
import 'package:app_valtx_asistencia/app/models/response/sgv/response_vacationsgv_model.dart';
import 'package:app_valtx_asistencia/app/providers/justification_user_provider.dart';
import 'package:get/get.dart';

class RegisterJustificationRepository {
  final _apiProvider = Get.find<RegisterJustificationUserProvider>();

  /* 📌 Registrar justificación */
  Future<ResponseJustificationModel> postRegisterJustification(
    RequestJustificationModel request,
  ) =>
      _apiProvider.postRegisterJustification(request);

  /* 📌 Registrar permisos*/
  Future<ResponseAddPermissionModel> postRegisterPermission(
    RequestAddPermissionModel request,
  ) =>
      _apiProvider.postRegisterPermission(request);

  /* 📌 Obtener indicadores vacacionales de sgv */
  Future<ResponseIndicatorsVacation> getIndicatorsSGV(
    String codigo,
  ) =>
      _apiProvider.getIndicatorsSGV(codigo);

  /* 📌 Registrar vacaciones en sgv */
  Future<ResponseVacationSgvModel> postRegisterVacations(
    RequestVacationSvgModel request,
  ) =>
      _apiProvider.postRegisterVacations(request);
}
