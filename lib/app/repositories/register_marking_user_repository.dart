import 'package:app_valtx_asistencia/app/models/request/request_email_model.dart';
import 'package:app_valtx_asistencia/app/models/request/request_marking_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/others/response_sendemail_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_register_marking_user_model.dart';
import 'package:app_valtx_asistencia/app/providers/register_marking_user_provider.dart';
import 'package:get/get.dart';

class RegisterMarkingUserRepository{
  final _apiProvider = Get.find<RegisterMarkingUserProvider>();

  Future<ResponseRegisterMarkingUserModel> postRegisterMarking(
    RequestMarkingUserModel request,
  ) =>
      _apiProvider.postRegisterMarking(request);

  /* 📌 Para enviar correo cuando un trabajador registro su asitencia (tarde, fuera de hora, y sobretiempo1) */
  Future<ResponseSendEmailModel> postSendEmail(
    RequestEmailModel request,
  ) =>
      _apiProvider.postSendEmail(request);
}
