import 'package:app_valtx_asistencia/app/local/storage_service.dart';
import 'package:app_valtx_asistencia/app/models/request/request_authentication_model.dart';
import 'package:app_valtx_asistencia/app/repositories/authentication_repository.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/helpers/keys.dart';
import 'package:app_valtx_asistencia/routes/app_routes_name.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    _initialize();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  //Instance
  final _authenticationRepository = Get.find<AuthenticationRepository>();

  //Variables
  String userName = "";
  String password = "";
  RxBool isLoading = false.obs;
  RxBool isVisible = false.obs;

  //Functions

  void _initialize() async {
    isLoading.value = true;
    try {
      final userName = await StorageService.get(Keys.kUserName);
      final password = await StorageService.get(Keys.kPassword);

      /* print("usename: ${userName}");
      print("password: ${password}"); */

      if (userName.isEmpty && password.isEmpty) {
        /*  print("LLEGA aqui"); */
        Get.offNamed(AppRoutesName.LOGIN);
        return;
      }

      final response = await _authenticationRepository.postAuthentication(
        RequestAuthenticationModel(
          username: userName,
          password: password,
        ),
      );

      if (!response.success) {
        Get.offNamed(AppRoutesName.LOGIN);
        return;
      }

      await StorageService.set(
        key: Keys.kTokenSesion,
        value: response.data!.token,
      );
      /* print("o LLEGA aqui"); */
      Future.delayed(
        const Duration(milliseconds: 600),
        () {
          Get.offNamed(AppRoutesName.HOME);
        },
      );
    } catch (e) {
      /* print("error del splash: ${e}"); */
      isVisible.value = true;
      Helpers.showSnackBar(
        Get.context!,
        title: "Validar",
        message: Helpers.knowTypeError(e.toString()),
      );
    }
  }
}
