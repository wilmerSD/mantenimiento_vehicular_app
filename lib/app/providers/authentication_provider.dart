import 'package:app_valtx_asistencia/app/models/request/request_authentication_model.dart';
import 'package:app_valtx_asistencia/app/models/request/request_token_device_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_authentication_model.dart';
import 'package:app_valtx_asistencia/core/network/dio_client.dart';
import 'package:get/get.dart';

class AuthenticationProvider {
  final _dioClient = Get.find<DioClient>();

  Future<ResponseAuthenticationModel> postAuthentication(
    RequestAuthenticationModel request,
  ) async {
    final response = await _dioClient.post(
      path: "/api/auth/login",
      bodyRaw: request.toMap(),
    );
    return ResponseAuthenticationModel.fromJson(response);
  }

    Future<void> postRegisterTokenDevice(
    RequestTokenDeviceModel request,
  ) async {
    await _dioClient.post(
      path: "/api/user/addTokenUser",
      bodyRaw: request.toJson(),
    );
  }
}
