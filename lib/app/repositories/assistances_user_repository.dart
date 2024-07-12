import 'package:app_valtx_asistencia/app/models/request/request_assistance%20_information_model.dart';
import 'package:app_valtx_asistencia/app/models/request/request_id_user_model.dart';
import 'package:app_valtx_asistencia/app/models/request/typesrequest/request_getallmyreques_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_assistances_day_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_assistances_month_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_assistances_week_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_getallmyrequest_model.dart';
import 'package:app_valtx_asistencia/app/providers/assistances_user_provider.dart';
import 'package:get/get.dart';

class AssistanceMonthUserRepository {
  final _apiProvider = Get.find<AssistanceMonthUserProvider>();

  Future<ResponseAssistancesMonthUserModel> getAssistancesMonthDate(
    RequestAssistanceInformationModel request,
  ) =>
      _apiProvider.getAssistancesMonthDate(request);
}

class AssistanceWeekUserRepository {
  final _apiProvider = Get.find<AssistanceWeekUserProvider>();

  Future<ResponseAssistancesWeekUserModel> getAssistancesWeek(
    RequestIdUserModel request,
  ) =>
      _apiProvider.getAssistancesWeek(request);
}

class AssistanceDayUserRepository {
  final _apiProvider = Get.find<AssistanceDayUserProvider>();

  Future<ResponseAssistancesDayUserModel> getAssistancesDay(
    RequestAssistanceInformationModel request,
  ) =>
      _apiProvider.getAssistancesDay(request);
}

/* 📌 Obtener mis solicitudes*/
class GetAllMyRequetsRepository {
  final _apiProvider = Get.find<GetAllMyRequetsProvider>();

  Future<ResponseGetAllMyRequestModel> getAllMyRequest(
    RequestGetAllMyRequestModel request,
  ) =>
      _apiProvider.getAllMyRequest(request);
}