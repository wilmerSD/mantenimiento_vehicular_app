import 'package:app_valtx_asistencia/app/models/request/request_changepass_model.dart';
import 'package:app_valtx_asistencia/app/models/request/request_recoverpass_model.dart';
import 'package:app_valtx_asistencia/app/models/request/request_shedule_user_model.dart';
import 'package:app_valtx_asistencia/app/models/request/request_user_information_model.dart';
import 'package:app_valtx_asistencia/app/models/request/request_verifycode_model.dart';
import 'package:app_valtx_asistencia/app/models/response/others/response_shedule_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_general_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_recoverpass_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_user_information_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_verifycode_model.dart';
import 'package:app_valtx_asistencia/app/providers/user_provider.dart';
import 'package:get/get.dart';

class UserRepository {
  final _apiProvider = Get.find<UserProvider>();

  Future<ResponseUserInformationModel> getUserInformation(
    RequestUserInformationModel request,
  ) =>
      _apiProvider.getUserInformation(request);

  // Obtener horario por usuario
  Future<ResponseScheduleByUser> scheduleByUser(
          RequestScheduleByUser request) =>
      _apiProvider.scheduleByUser(request);

  /* 📌 Actualizar contraseña */
  Future<ResponseGeneralModel> changePassword(RequestChangePassModel request) =>
      _apiProvider.changePassword(request);

/* 📌 Recuperar contraseña obtener de código */
  Future<ResponseRecoverPassModel> getCodeToChangePass(
          RecoverPassModel request) =>
      _apiProvider.getCodeToChangePass(request);

  /* 📌 Recuperar contraseña envío de código */
  Future<ResponseVerifyCodeModel> sendCodeToChangePass(
          RequestVerifyCodeModel request) =>
      _apiProvider.sendCodeToChangePass(request);
}
