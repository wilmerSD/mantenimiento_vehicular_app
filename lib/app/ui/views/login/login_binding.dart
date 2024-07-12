import 'package:app_valtx_asistencia/app/ui/views/login/login_controller.dart';
import 'package:get/get.dart';

class LoginBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
