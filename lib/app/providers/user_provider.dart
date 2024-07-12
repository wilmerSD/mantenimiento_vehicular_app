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
import 'package:app_valtx_asistencia/core/network/dio_client.dart';
import 'package:get/get.dart';

class UserProvider {
  final _dioClient = Get.find<DioClient>();

  Future<ResponseUserInformationModel> getUserInformation(
    RequestUserInformationModel request,
  ) async {
    final response = await _dioClient.post(
      path: "/api/user/information",
      bodyRaw: request.toMap(),
    );
    return ResponseUserInformationModel.fromJson(response);
  }

  //Obtener horario por usuario
  Future<ResponseScheduleByUser> scheduleByUser(
    RequestScheduleByUser request,
  ) async {
    final response = await _dioClient.post(
      path: "/api/schedules/scheduleByUser",
      bodyRaw: request.toJson(),
    );
    return ResponseScheduleByUser.fromJson(response);
  }

  /* 📌 Actualizar contraseña */
  Future<ResponseGeneralModel> changePassword(
    RequestChangePassModel request,
  ) async {
    final response = await _dioClient.put(
      path: "/api/user/putupdatePassword",
      bodyRaw: request.toMap(),
    );
    return ResponseGeneralModel.fromJson(response);
  }

  /* 📌 Recuperar contraseña recibir de código */
  Future<ResponseRecoverPassModel> getCodeToChangePass(
    RecoverPassModel request,
  ) async {
    final response = await _dioClient.post(
      path: "/api/user/sendCodeVerfication",
      bodyRaw: request.toMap(),
    );
    return ResponseRecoverPassModel.fromJson(response);
  }

  /* 📌 Recuperar contraseña envío de código */
  Future<ResponseVerifyCodeModel> sendCodeToChangePass(
    RequestVerifyCodeModel request,
  ) async {
    final response = await _dioClient.post(
      path: "/api/user/verificationOfCode",
      bodyRaw: request.toMap(),
    );
    return ResponseVerifyCodeModel.fromJson(response);
  }
}
