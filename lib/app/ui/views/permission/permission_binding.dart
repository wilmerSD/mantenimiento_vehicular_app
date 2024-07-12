import 'package:app_valtx_asistencia/app/ui/views/permission/permission_controller.dart';
import 'package:get/get.dart';

class PermissionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PermissionController());
  }
}
