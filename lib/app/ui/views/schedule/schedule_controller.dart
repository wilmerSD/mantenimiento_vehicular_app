import 'package:app_valtx_asistencia/app/local/storage_service.dart';
import 'package:app_valtx_asistencia/app/models/request/request_shedule_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/others/response_shedule_user_model.dart';
import 'package:app_valtx_asistencia/app/repositories/user_repositori.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/helpers/keys.dart';
import 'package:get/get.dart';

class ScheduleController extends GetxController {
  @override
  void onInit() {
    _initialize();
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  //Instances
  final _userRepository = Get.find<UserRepository>();
  //Variables
  var scheduleByUser = Data().obs;
  RxString idEmployee = RxString('0');
  RxBool isLoadingSchedule = RxBool(false);
  RxBool scheduleByUserSuccess = RxBool(false);
  //Functions

  /* 📌 Para inicializar variables */
  void _initialize() async {
    await getScheduleByUser();
  }

  getScheduleByUser() async {
    try {
      isLoadingSchedule.value = true;
      idEmployee.value = await StorageService.get(Keys.kIdUser);
      final response = await _userRepository.scheduleByUser(
        RequestScheduleByUser(idUser: idEmployee.value),
      );

      scheduleByUser.value = response.data ?? Data();
      scheduleByUserSuccess.value = true;
      isLoadingSchedule.value = false;
    } catch (e) {
      isLoadingSchedule.value = false;
      Helpers.showSnackBar(
        Get.context!,
        title: "Validar",
        message: Helpers.knowTypeError(e.toString()),
      );
    } finally {
      isLoadingSchedule.value = false;
    }
  }
}
