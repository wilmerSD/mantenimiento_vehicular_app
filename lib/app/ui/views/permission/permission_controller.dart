import 'package:app_valtx_asistencia/app/local/storage_service.dart';
import 'package:app_valtx_asistencia/app/models/request/request_add_permission_model.dart';
import 'package:app_valtx_asistencia/app/models/request/request_vacationsgv_model.dart';
import 'package:app_valtx_asistencia/app/models/response/others/response_select_model.dart';
import 'package:app_valtx_asistencia/app/models/response/sgv/response_indicatorsvacation_model.dart';
import 'package:app_valtx_asistencia/app/repositories/justification_user_repository.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/helpers/keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PermissionController extends GetxController {
  @override
  void onInit() {
    initialize();

    super.onInit();
    /* getDateCurrent(); */
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

  //variables
  TextEditingController datePermission = TextEditingController(text: '');
  TextEditingController firstDate = TextEditingController(text: '');
  TextEditingController endDate = TextEditingController(text: '');
  TextEditingController reason = TextEditingController(text: '');
  TextEditingController reasonVacations = TextEditingController(text: '');
  String formattedDate = '';
  RxList<DatumSelect2Combo> stateListToCreateTEC = RxList([
    DatumSelect2Combo(value: -1, text: "Elegir solicitud"),
    DatumSelect2Combo(value: 2, text: "Permisos"),
    DatumSelect2Combo(value: 3, text: "Vacaciones"),
  ]);
  RxInt currentRequest = RxInt(-1);
  RxBool isLoading = false.obs;
  RxBool statusPermission = false.obs;
  RxBool statusVacations = false.obs;
  RxString statusMessageUserPermission = RxString("");
  RxString statusMessageVacations = RxString("");
  RxString messageError = RxString("");
  RxString messageErrorVacations = RxString("");
  RxBool isVisible = false.obs;

  String cip = '';
  int adelanto = 0;
  String iduser = '';
  String idRol = '';
  TextEditingController truncatedDay = TextEditingController();
  TextEditingController pendingDay = TextEditingController();
  TextEditingController expiredDay = TextEditingController();
  TextEditingController lawDay = TextEditingController();
  RxBool isPreviewVacation = RxBool(false);

  //Instancias

  final _permissionRepository = Get.find<RegisterJustificationRepository>();

  //FUNCTIONS
  /* 📌 Inicializar variables o funciones */
  Future<void> initialize() async {
    await getInformationUser();
    await getIndicatorsVacations();
    getDateCurrent();
  }

  /* 📌 Obtener información de LocalStorage */
  getInformationUser() async {
    iduser = await StorageService.get(Keys.kIdUser);
    /* print("iduser: $iduser"); */
    idRol = await StorageService.get(Keys.kIdRole);
    /* print("idRol: $idRol"); */
    cip = await StorageService.get(Keys.kCip);
    /* print(cip); */
  }

  /* 📌 Validar inputs de permiso y realizar la solicitud */
  validateForm(BuildContext context) async {
    /* FocusScope.of(context).unfocus(); */
    if (datePermission.text.trim() == "") {
      Helpers.showSnackBar(
        context,
        title: "Validar",
        message: "Debe ingresar una fecha de permiso",
      );
      return;
    }
    await addPermission();
  }

  /* 📌 Validar inputs de vacaciones y realizar la solicitud */
  validateVacations(BuildContext context) async {
    /* FocusScope.of(context).unfocus(); */
    if (firstDate.text.trim() == "" || endDate.text.trim() == "") {
      Helpers.showSnackBar(
        context,
        title: "Validar",
        message: "Debe ingresar una rango de fechas para las vacaciones",
      );
      return;
    }
    await postRegisterVacationSVG();
  }

  /* 📌 Registrar solicitud de permiso */
  addPermission() async {
    isLoading.value = true;
    try {
      final response = await _permissionRepository.postRegisterPermission(
          RequestAddPermissionModel(
              idUser: int.parse(iduser),
              idRole: int.parse(idRol),
              datePermission: Helpers.changeDateToyyyyMMdd(datePermission.text),
              reason: reason.text));

      statusPermission.value = response.success;
      statusMessageUserPermission.value = response.statusMessage;

      if (!response.success) {
        Helpers.showSnackBar(
          Get.context!,
          title: "Validar",
          message: statusMessageUserPermission.value,
        );
        return;
      }
      Helpers.showSnackBarSuccess(
        Get.context!,
        title: "Con éxito",
        message: statusMessageUserPermission.value,
      );
      cleanReasonPermission();
    } catch (e) {
      isVisible.value = true;
      Helpers.showSnackBar(
        Get.context!,
        title: "Validar",
        message: Helpers.knowTypeError(e.toString()),
      );
    } finally {
      isLoading.value = false;
    }
  }

  /* 📌 Limpiar variables de permiso */
  cleanReasonPermission() {
    datePermission.text = "";
    reason.text = "";
    statusPermission.value = false;
  }

  /* 📌 Limpiar variables de vacaciones */
  cleanReasonVacations() {
    firstDate.text = "";
    endDate.text = "";
    reasonVacations.text = "";
    statusVacations.value = false;
  }

  int truncatedDayp = 0;
  int pendingDayp = 0;
  int expiredDayp = 0;
  int lawDayp = 0;

  /* 📌 Obtener indicadores vacacionales */
  Future<void> getIndicatorsVacations() async {
    try {
      final response = await _permissionRepository.getIndicatorsSGV(cip);
      Indicador responseIndicatorsVacation = response.data!.indicador!;
      if (!response.success) {
        Helpers.showSnackBar(
          Get.context!,
          title: "Validar",
          message:
              'Ha ocurrido un error, tratando de optener su información vacacional',
        );
        return;
      }
      truncatedDayp = responseIndicatorsVacation.diasTruncos ?? 0;
      pendingDayp = responseIndicatorsVacation.diasPendientes ?? 0;
      expiredDayp = responseIndicatorsVacation.diasVencidos ?? 0;

      truncatedDay.text = truncatedDayp.toString();
      pendingDay.text = pendingDayp.toString();
      expiredDay.text = expiredDayp.toString();
      lawDay.text = responseIndicatorsVacation.fechaDerecho ?? '';
    } catch (e) {
      Helpers.showSnackBar(
        Get.context!,
        title: "Validar",
        message: Helpers.knowTypeError(e.toString()),
      );
    }
  }

  /* 📌 Registrar vacaciones en SVG */
  Future<void> postRegisterVacationSVG() async {
    isLoading.value = true;
    if (isPreviewVacation.value == true) {
      adelanto = 1;
    } else {
      adelanto = 0;
    }
    try {
      final response = await _permissionRepository.postRegisterVacations(
          RequestVacationSvgModel(
              codigo: cip,
              perfil: "U",
              inicio: firstDate.text,
              fin: endDate.text,
              adelanto: adelanto.toString()));

      if (!response.success) {
        Helpers.showSnackBar(
          Get.context!,
          title: "Validar",
          message: response.data.descripcion ?? '',
        );
        return;
      }

      Helpers.showSnackBarSuccess(
        Get.context!,
        title: "Con éxito",
        message: response.data.mensaje ??
            'Solicitud de vacaciones añadida con éxito',
      );
      cleanDatesVacation();
    } catch (e) {
      Helpers.showSnackBar(
        Get.context!,
        title: "Validar",
        message: Helpers.knowTypeError(e.toString()),
      );
    } finally {
      adelanto = 0;
      isLoading.value = false;
    }
  }

  /* 📌 Limpiar variables de solicitud de vacaciones */
  void cleanDatesVacation() {
    firstDate.text = '';
    endDate.text = '';
    isPreviewVacation.value = false;
  }

  /* 📌 Cambiar a true o false segun se requiera */
  void toggleCheckIsPreview() {
    isPreviewVacation.value =
        !isPreviewVacation.value; // Cambia el valor de isChecked
  }

  String dateToday = '';

  /* 📌 Obtener fechas */
  Future<void> getDateCurrent() async {
    DateTime now = DateTime.now();
    dateToday = DateFormat('dd/MM/yyyy').format(now);
  }

  /* Future<void> getDateCurrent() async {
    DateTime now = DateTime.now();
    DateTime tomorrow = now.add(Duration(days: 1));
    formattedDate = DateFormat('yyyy/MM/dd').format(tomorrow);

    // Actualiza el controlador de texto con la nueva fecha
    datePermission.text = formattedDate;
  } */
}
