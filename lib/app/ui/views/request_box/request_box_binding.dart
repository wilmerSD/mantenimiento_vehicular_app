import 'package:app_valtx_asistencia/app/ui/views/request_box/request_box_controller.dart';
import 'package:get/get.dart';

class RequestBoxBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RequestBoxController());
  }
}
