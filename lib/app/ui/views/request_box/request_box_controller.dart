import 'package:app_valtx_asistencia/app/local/storage_service.dart';
import 'package:app_valtx_asistencia/app/models/request/typesrequest/request_getallmyreques_model.dart';
import 'package:app_valtx_asistencia/app/models/response/others/response_select_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_getallmyrequest_model.dart';
import 'package:app_valtx_asistencia/app/repositories/assistances_user_repository.dart';
import 'package:app_valtx_asistencia/core/helpers/keys.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestBoxController extends GetxController {
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    /* getAllMyRequest(); */
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
    DatumSelect2Combo(value: 1, text: "Justificaciones"),
    DatumSelect2Combo(value: 2, text: "Permisos"),
    DatumSelect2Combo(value: 3, text: "Vacaciones"),
  ]);
  RxList<DatumSelect2Combo> listStatusRequest = RxList([
    DatumSelect2Combo(value: -1, text: "Elegir estado"),
    DatumSelect2Combo(value: 1, text: "En proceso"),
    DatumSelect2Combo(value: 2, text: "Aprobado por líder"),
    DatumSelect2Combo(value: 3, text: "Rechazado por líder"),
  ]);
  RxInt currentRequest = RxInt(-1);
  RxInt currentStateRequest = RxInt(-1);
  RxBool isLoading = false.obs;
  RxBool isLoadingJustifications = false.obs;
  RxBool statusPermission = false.obs;
  RxBool statusVacations = false.obs;
  RxString statusMessageUserPermission = RxString("");
  RxString statusMessageVacations = RxString("");
  RxString messageError = RxString("");
  RxString messageErrorVacations = RxString("");
  RxBool isVisible = false.obs;
  List<DatumGetAllMyRequest> getAllMyRequestResponse = [];

  //INSTANCES
  final _getAllMyRequest = Get.find<GetAllMyRequetsRepository>();

  //FUNTIONS
  /* 📌 Función para inicializar funciones*/
  void _initialize() async {
    getAllMyRequest();
  }

  /* 📌 Limpiar variables de tipo de solicitud */
  void clean() {
    getAllMyRequestResponse = [];
  }

  /* 📌 Para obtener justificaciones */
  Future<void> getAllMyRequest({
    int stateInProgress = 1,
    int stateApprovedByLeader = 2,
    int stateRejectedByLeader = 3,
  }) async {
    String idUser = await StorageService.get(Keys.kIdUser);
    try {
      isLoadingJustifications.value = true;
      final response =
          await _getAllMyRequest.getAllMyRequest(RequestGetAllMyRequestModel(
        idUser: int.parse(idUser),
        typeRequest: currentRequest.value,
        stateInProgress: stateInProgress,
        stateApprovedByLeader: stateApprovedByLeader,
        stateRejectedByLeader: stateRejectedByLeader,
        stateInProgressRrhh: 4, //Habilitar si es que piden doble validación
        stateAprovedByRrhh: 5, //Habilitar si es que piden doble validación
        stateRejectedByRrhh: 6, //Habilitar si es que piden doble validación
        page: 1,
      ));

      if (response.success == true) {
        getAllMyRequestResponse = response.data ?? [];
      }
    } catch (e) {
      print(e);
    } finally {
      isLoadingJustifications.value = false;
    }
  }

/*   /* 📌 Para obtener justificaciones filtro */
  Future<void> getAllMyRequestFilter() async {
    String idUser = await StorageService.get(Keys.kIdUser);
    try {
      final response =
          await _getAllMyRequest.getAllMyRequest(RequestGetAllMyRequestModel(
        idUser: int.parse(idUser),
        typeRequest: currentRequest.value,
        stateInProgress: currentStateRequest.value,
        stateApprovedByLeader: currentStateRequest.value,
        stateRejectedByLeader: currentStateRequest.value,
        stateInProgressRrhh: 4, //Habilitar si es que piden doble validación
        stateAprovedByRrhh: 5, //Habilitar si es que piden doble validación
        stateRejectedByRrhh: 6, //Habilitar si es que piden doble validación
        page: 1,
      ));

      if (response.success == true) {
        getAllMyRequestResponse = response.data ?? [];
      }
    } catch (e) {
      print(e);
    } finally {}
  }
 */
  /* 📌 Para obtener permisos */
  Future<void> getAllMyPermission() async {
    try {} catch (e) {
      print(e);
    } finally {}
  }

  /* 📌 Para obtener vacaciones */
  Future<void> getAllMyVacations() async {
    try {} catch (e) {
      print(e);
    } finally {}
  }
}
