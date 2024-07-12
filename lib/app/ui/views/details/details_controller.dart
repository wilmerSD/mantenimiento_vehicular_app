import 'dart:convert';
import 'package:app_valtx_asistencia/app/local/storage_service.dart';
import 'package:app_valtx_asistencia/app/models/request/request_assistance%20_information_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_assistances_day_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_assistances_month_user_model.dart';
import 'package:app_valtx_asistencia/app/providers/assistances_user_provider.dart';
import 'package:app_valtx_asistencia/app/repositories/assistances_user_repository.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/helpers/keys.dart';
import 'package:app_valtx_asistencia/app/models/response/response_types_validations_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailsController extends GetxController {
  @override
  void onInit() async {
    await detailsControllerDate(selectedDate);
    await detailsControllerDates(formattedDate);
    _typesValidationsuser();
    assistancesDayUser(formattedDate);
    getAssistancesMonthUser(formattedDate);

    super.onInit();
  }



  //Instances
  final _assistancesDayUserRepository = Get.find<AssistanceDayUserRepository>();
  final _assistancesMonthkUserRepository =
      Get.find<AssistanceMonthUserProvider>();

  //variables
  var responseTypesValidations = <Datum>[].obs;
  var responseDataDia = <DatumDay>[].obs;
  var responseDataMes = <DatumMonth>[].obs;
  var selectedDate = DateTime.now();
  var fecha = DateTime.now();
  RxString statusMessageDay = ''.obs;
  RxString statusMessageMonth = ''.obs;
  RxString messageError = ''.obs;
  RxString formattedDateNow  = ''.obs;
  RxString day = ''.obs;
  RxInt montInt = 1.obs;
  RxString age = ''.obs;
  String month = '';
  String formattedDate = '';
  RxBool isLoading = false.obs;
  RxBool isLoadingTypesValidation = false.obs;
  RxBool isVisible = false.obs;
  RxBool isVisibleDay = false.obs;

  //Funciones

  //Formatear la hora
  detailsControllerDate(selectedDates) {
    formattedDate = DateFormat('yyyy-MM-dd').format(selectedDates);
  }

  //Convertir la hora
  detailsControllerDates(String selectedDateFormat) {
    final parts = selectedDateFormat.split('-'); 
    age.value = parts[0];
    month = parts[1];
    montInt.value = int.parse(month);
    day.value = parts[2]; 
  }

  //Tipos de validacion
  void _typesValidationsuser() async {
    isLoadingTypesValidation.value = true;
    final storedTypesValidation =
        await StorageService.get(Keys.kTypesValidation);
    final decodedTypesValidation = json.decode(storedTypesValidation);
    final typesValidationList = (decodedTypesValidation['data'] as List)
        .map((item) => Datum.fromJson(item))
        .toList();
    responseTypesValidations.assignAll(typesValidationList);
    isLoadingTypesValidation.value = false;
  }

  //Asistencias del mes de usuario
  void getAssistancesMonthUser(formattedDateToday) async {
    isLoading.value = true;
    String Iduser = await StorageService.get(Keys.kIdUser);
    final response =
        await _assistancesMonthkUserRepository.getAssistancesMonthDate(
      RequestAssistanceInformationModel(
          idUser: int.parse(Iduser), date: formattedDateToday),
    );
    isLoading.value = false;
    responseDataMes.assignAll(response.data ?? []);
    statusMessageMonth.value = response.statusMessage;
    if (!response.success) {
      print("error: ${response.statusMessage}");
      return;
    }
  }

  //Asistencias del dia de usuario
  void assistancesDayUser(formattedDateToday) async {
    try {
      isVisibleDay.value = true;
      String Iduser = await StorageService.get(Keys.kIdUser);
      final response = await _assistancesDayUserRepository.getAssistancesDay(
        RequestAssistanceInformationModel(
          idUser: int.parse(Iduser),
          date: formattedDateToday,
        ),
      );

      isVisibleDay.value = false;
      responseDataDia.assignAll(response.data ?? []);
      statusMessageDay.value = response.statusMessage;
      if (!response.success) {
        return;
      }
    } catch (error) {
      isVisible.value = true;
      Helpers.showSnackBar(
        Get.context!,
        title: "Validar",
        message:
            "Ups! Ocurrió un error, por favor inténtelo de nuevo más tarde.",
      );
    }
  }
}
