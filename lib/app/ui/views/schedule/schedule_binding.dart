import 'package:app_valtx_asistencia/app/ui/views/schedule/schedule_controller.dart';
import 'package:get/get.dart';

class ScheduleBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScheduleController());
  }
}
