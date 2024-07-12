import 'package:app_valtx_asistencia/app/ui/views/changepass/changepass_controller.dart';
import 'package:get/get.dart';

class ChangePassBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChangePassController());
  }
}
