import 'package:app_valtx_asistencia/app/models/request/request_authentication_model.dart';
import 'package:app_valtx_asistencia/app/models/request/request_token_device_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_authentication_model.dart';
import 'package:app_valtx_asistencia/app/providers/authentication_provider.dart';
import 'package:get/get.dart';

class AuthenticationRepository {
  final _apiProvider = Get.find<AuthenticationProvider>();

  Future<ResponseAuthenticationModel> postAuthentication(
    RequestAuthenticationModel request,
  ) =>
      _apiProvider.postAuthentication(request);

  Future<void> postRegisterTokenDevice(
    RequestTokenDeviceModel request,
  ) =>
      _apiProvider.postRegisterTokenDevice(request);
}
