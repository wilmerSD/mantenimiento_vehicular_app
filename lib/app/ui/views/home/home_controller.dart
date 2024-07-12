import 'dart:convert';
import 'package:app_valtx_asistencia/app/local/push_notification_service.dart';
import 'package:app_valtx_asistencia/app/local/storage_service.dart';
import 'package:app_valtx_asistencia/app/models/request/request_assistance%20_information_model.dart';
import 'package:app_valtx_asistencia/app/models/request/request_email_model.dart';
import 'package:app_valtx_asistencia/app/models/request/request_justification_model.dart';
import 'package:app_valtx_asistencia/app/models/request/request_token_device_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_assistances_month_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_assistances_week_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_register_marking_user_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_types_assistances_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_user_information_model.dart';
import 'package:app_valtx_asistencia/app/repositories/assistances_user_repository.dart';
import 'package:app_valtx_asistencia/app/repositories/authentication_repository.dart';
import 'package:app_valtx_asistencia/app/repositories/justification_user_repository.dart';
import 'package:app_valtx_asistencia/app/repositories/types_validations_repository.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/helpers/keys.dart';
import 'package:app_valtx_asistencia/app/models/request/request_id_user_model.dart';
import 'package:app_valtx_asistencia/app/models/request/request_marking_user_model.dart';
import 'package:app_valtx_asistencia/app/repositories/register_marking_user_repository.dart';
import 'package:app_valtx_asistencia/app/repositories/types_assistances_repository.dart';
import 'package:app_valtx_asistencia/app/repositories/user_repositori.dart';
import 'package:app_valtx_asistencia/routes/app_routes_name.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart' as locations;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeController extends GetxController {
  @override
  void onInit() async {
    _initialize();
    super.onInit();
    update();
  }

  @override
  void onReady() async {
    /* update(); */
    super.onReady();
  }

  //Instance

  final _authenticationRepository = Get.find<AuthenticationRepository>();
  final _registerMarkingUser = Get.find<RegisterMarkingUserRepository>();
  final _typesAssistances = Get.find<TypesAssistancesUserRepository>();
  final _typesValidationsRepository = Get.find<TypesValidationsRepository>();
  final _assistancesWeekUserRepository =
      Get.find<AssistanceWeekUserRepository>();
  final _assistancesMonthkUserRepository =
      Get.find<AssistanceMonthUserRepository>();
  final _justificationRepository = Get.find<RegisterJustificationRepository>();

  locations.Location location = locations.Location();
  locations.LocationData? locationData;
  final _userRepository = Get.find<UserRepository>();

  //Variables
  var responseUserInformation = DataUser().obs;
  var responseUserAssistance = DataMark().obs;
  var responseTypesMarking = <DatumAssistances>[].obs;
  var responseUserAssistanceWeek = <DatumWeek>[].obs;
  var responseUserAssistanceMonth = <DatumMonth>[].obs;
  RxString messageHintText = RxString(
      "Ej: Buen dia estimado(a) Nombres,\nEl motivo de mi tardanza es ...\nGracias de antemano por su\ncomprención");
  RxString statusMessageTypesMarking = RxString("");
  RxString statusMessageUserInformation = RxString("");
  RxString statusMessageUserJustification = RxString("");
  RxString statusMessageWeek = RxString("");
  RxString statusMessageMonth = RxString("");
  RxString statusMessageUserAssistance = RxString("");
  RxString messageError = RxString("");
  RxString nameLocation = "Obteniendo ubicación...".obs;
  LatLng workPosition = const LatLng(-12.086660314676623, -76.99120477371234);
  //RxBool statusJustification = false.obs;
  RxBool statusAssistance = false.obs;
  RxBool statusAssistanceSecond = true.obs;
  RxBool isLoading = false.obs;
  RxBool isLoadingValidation = false.obs;
  RxBool isLoadingMonth = false.obs;
  RxBool isLoadingWeek = false.obs;
  RxBool isLoadingMarks = true.obs;
  RxBool isLoadingJustification = false.obs;
  RxBool isLoadingUser = false.obs;
  RxBool isVisible = false.obs;
  RxBool controlHintText = true.obs;
  double latitude = 0.0;
  double longitude = 0.0;
  int selectedValue = 0;
  String descriptionTypeMark = '';
  String reasonJustification = '';
  RxString reasonJustificationControl = ''.obs;
  DateTime? selectedDate;
  String? formattedDate;
  final Rx<LatLng> currentLocation = Rx<LatLng>(const LatLng(0, 0));
  late BitmapDescriptor iconMap = BitmapDescriptor.defaultMarker;
  RxBool statusJustification = RxBool(false);
  int validationAgreed = 1; //1 es el tipo de validación conforme
  String idUser = '';
  RxString fullNameUser = RxString('');

  //Functions
  void _initialize() async {
    await getIcons();
    await getInfoUserLocal();
    await PushNotificationService.inicializeApp();
    await _getinformationUser();
    await detailsControllerDate();
    /* await _typesValidationsuser(); */
    /* await _getAssistancesMonthUser(formattedDate); */
    /* await _getAssistancesWeekhUser(); */
    /* print("escuchando movimientos"); */
    listenToLocationChanges();
    /* print("escuchando movimientos2"); */
    await _checkLocationPermission();
    await getCurrentLocation();
    await getNameLocation();
    await _getTypesMarking();
  }

  //Obtener información del usuario de LocalStorage
  Future<void> getInfoUserLocal() async {
    idUser = await StorageService.get(Keys.kIdUser);
    fullNameUser.value = await StorageService.get(Keys.kNameUser);
  }

  //traer información del usuario
  _getinformationUser() async {
    isLoadingUser.value = true;
    try {
      /* final response = await _userRepository.getUserInformation(
      RequestUserInformationModel(
        username: await StorageService.get(Keys.kUserName),
        password: await StorageService.get(Keys.kPassword),
      ),
    );
    
    responseUserInformation.value = response.data;
    statusMessageUserInformation.value = response.statusMessage;
    if (!response.success) return;

    final idUser = response.data.idUser;
    final idRole = response.data.idRole;
    final email = response.data.email;
    final nameUser = "${response.data.names} ${response.data.lastNames}";
    await StorageService.set(key: Keys.kIdUser, value: idUser.toString());
    await StorageService.set(key: Keys.kIdRole, value: idRole.toString());
    await StorageService.set(key: Keys.kNameUser, value: nameUser);
    await StorageService.set(key: Keys.kEmail, value: email); */
      //Insertar token de dispositivo en BD
      _authenticationRepository.postRegisterTokenDevice(
        RequestTokenDeviceModel(
          idUsuario: int.parse(idUser),
          txtTokenUsuario: await StorageService.get(Keys.kTokenDevice),
        ),
      );
    } catch (e) {
      Helpers.showSnackBar(
        Get.context!,
        title: "Validar",
        message: Helpers.knowTypeError(e.toString()),
      );
    } finally {
      isLoadingUser.value = false;
    }
  }

  //tipos de marcación
  _getTypesMarking() async {
    isLoadingMarks.value = true;
    try {
      final response = await _typesAssistances.getTypesAssistances();
      responseTypesMarking.assignAll(response.data);
      statusMessageTypesMarking.value = response.statusMessage;
      if (!response.success) {
        return;
      }
    } catch (e) {
      Helpers.showSnackBar(
        Get.context!,
        title: "Validar",
        message: Helpers.knowTypeError(e.toString()),
      );
    } finally {
      isLoadingMarks.value = false;
    }
  }

  //Tipos de validacion
  _typesValidationsuser() async {
    final response = await _typesValidationsRepository.getTypesValidations();
    if (!response.success) {
      return;
    }
    await StorageService.set(
        key: Keys.kTypesValidation, value: json.encode(response.toJson()));
  }

  //Asistencia del mes
  _getAssistancesMonthUser(formattedDate) async {
    isLoadingMonth.value = true;
    String Iduser = await StorageService.get(Keys.kIdUser);
    final response =
        await _assistancesMonthkUserRepository.getAssistancesMonthDate(
      RequestAssistanceInformationModel(
          idUser: int.parse(Iduser), date: formattedDate),
    );

    responseUserAssistanceMonth.assignAll(response.data ?? []);
    statusMessageMonth.value = response.statusMessage;
    isLoadingMonth.value = false;
    if (!response.success) {
      return;
    }
  }

  //Asistencia de la semana
  _getAssistancesWeekhUser() async {
    isLoadingWeek.value = true;
    try {
      String Iduser = await StorageService.get(Keys.kIdUser);
      final response = await _assistancesWeekUserRepository.getAssistancesWeek(
        RequestIdUserModel(
          idUser: int.parse(Iduser),
        ),
      );

      responseUserAssistanceWeek.assignAll(response.data ?? []);
      statusMessageWeek.value = response.statusMessage;
      isLoadingWeek.value = false;
      if (!response.success) {
        return;
      }
    } catch (error) {
      isLoading.value = false;
      isVisible.value = true;
      messageError.value =
          'Ha ocurrido un error, por favor inténtelo de nuevo mas tarde';
    }
  }

  //Registrar asistencia
  assistMarker(selectedValue) async {
    isLoading.value = true;
    try {
      String Iduser = await StorageService.get(Keys.kIdUser);
      /* await getCurrentLocation();
      await getNameLocation(); */
      if (!(await location.serviceEnabled())) {
        messageError.value =
            "Por favor mantenga encendido su ubicación para poder registrar su asistencia";
        Helpers.showSnackBar(
          Get.context!,
          title: "Validar",
          message: messageError.value,
        );
        location.requestService();
        return;
      }
      final hasPermissions = await location.hasPermission();
      if (hasPermissions == locations.PermissionStatus.denied) {
        // Si el permiso de ubicación no está concedido, solicítalo
        messageError.value =
            "Por favor permita el acceso a la ubicación de lo contrario no podra registrar su asistencia";
        Helpers.showSnackBar(
          Get.context!,
          title: "Validar",
          message: messageError.value,
        );
        location.requestPermission();
        return;
      }
      final response = await _registerMarkingUser.postRegisterMarking(
        RequestMarkingUserModel(
            idUser: int.parse(Iduser),
            idTypesMarking: selectedValue,
            latitude: latitude,
            longitude: longitude,
            address: nameLocation.value),
      );

      statusAssistance.value = response.success;
      statusMessageUserAssistance.value = response.statusMessage;
      responseUserAssistance.value = response.data;

      if (!response.success) {
        statusAssistanceSecond.value = false;
        return;
      }
      if (responseUserAssistance.value.idTipoValidacion != validationAgreed) {
        await sendMailOutlook(selectedValue);
      }
      /* _getAssistancesMonthUser(formattedDate);
      _getAssistancesWeekhUser(); */
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

  /* 📌 Envio de correo con información de asistencia al lider o RRHH */
  Future<void> sendMailOutlook(selectedValue) async {
    try {
      String Iduser = await StorageService.get(Keys.kIdUser);
      final response =
          await _registerMarkingUser.postSendEmail(RequestEmailModel(
        idUser: int.parse(Iduser),
        idTypesMarking: selectedValue,
        validationOfMark: responseUserAssistance.value.registradoComo ?? '',
      ));
    } catch (e) {
      Helpers.showSnackBar(
        Get.context!,
        title: "Validar",
        message: Helpers.knowTypeError(e.toString()),
      );
    }
  }

  //Registrar justificación
  sendJustification(int selectedValue, String reason) async {
    isLoadingJustification.value = true;
    try {
      String Iduser = await StorageService.get(Keys.kIdUser);
      final response = await _justificationRepository.postRegisterJustification(
        RequestJustificationModel(
            idUser: int.parse(Iduser),
            idTypeMark: selectedValue,
            reason: reason),
      );

      statusJustification.value = response.success;
      statusMessageUserJustification.value = response.statusMessage;
      if (!response.success) {
        return;
      }
    } catch (e) {
      isLoadingJustification.value = true;
      Helpers.showSnackBar(
        Get.context!,
        title: "Validar",
        message: Helpers.knowTypeError(e.toString()),
      );
    } finally {
      isLoadingJustification.value = false;
    }
  }

  //Chequear los permisos de ubicación
  Future<void> _checkLocationPermission() async {
    final hasPermission = await location.hasPermission();
    if (hasPermission == locations.PermissionStatus.denied) {
      final requestPermission = await location.requestPermission();
      if (requestPermission != locations.PermissionStatus.granted) {
        //ha denegado los permisos de ubicación.
        // mensaje de error o solicitar permisos nuevamente.
        return;
      }
    }
    getCurrentLocation();
  }

  //Optener ubicación actual
  Future<void> getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    currentLocation.value = LatLng(position.latitude,
        position.longitude); // -12.086660314676623,-76.99120477371234
    latitude = position.latitude;
    longitude = position.longitude;
    update();
  }

  //Optener nombre de ubicación actual
  getNameLocation() async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    if (placemarks.isNotEmpty) {
      Placemark placemark = placemarks[0];
      String streetName = placemark.street ?? '';
      nameLocation.value = streetName;
    } else {
      nameLocation.value = "Ubicación no encontrada";
    }
  }

  //loginout
  loginout() async {
    await StorageService.deleteAll();
    Get.offAllNamed(AppRoutesName.LOGIN);
  }

  // cargar icono para el mapa
  getIcons() async {
    iconMap = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 2.5),
        "assets/markerValtx.png");
    update();
  }

  //Ir a detalles
  navigateToScreen() {
    Get.back();
    Get.toNamed(AppRoutesName.PERMISSION);
  }

  //Ir a cambiar contraseña
  navigateToChangePass() {
    Get.back();
    Get.toNamed(AppRoutesName.CHANGEPASS);
  }

  //Ir a horario
  navigateToSchedule() {
    /*  Get.back(); */
    Get.toNamed(AppRoutesName.SCHEDULE);
  }

  navigateToScreen2() {
    Get.back();
    Get.toNamed(AppRoutesName.REQUESTBOX);
  }

  // Guardando fecha en formato correcto
  detailsControllerDate() {
    selectedDate = DateTime.now();
    formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate!);
  }

  cleanReasonJustification() {
    reasonJustification = "";
    reasonJustificationControl.value = "";
    messageHintText.value =
        "Ej: Buen dia estimado(a) Nombres,\nEl motivo de mi tardanza es ...\nGracias de antemano por su\ncomprensión";
  }

  Future<void> getCordenasAndName() async {
    await getCurrentLocation();
    getNameLocation();
  }

  var currentLocations = const Position(
          latitude: 0,
          longitude: 0,
          timestamp: null,
          accuracy: 2.2,
          altitude: 2,
          altitudeAccuracy: 2,
          heading: 2,
          headingAccuracy: 2,
          speed: 2,
          speedAccuracy: 2)
      .obs;

  void listenToLocationChanges() {
    Geolocator.getPositionStream().listen((Position position) {
      currentLocations.value = position;
      // Aquí puedes llamar a la función que desees ejecutar cada vez que la ubicación cambie
      // Por ejemplo:
      // handleLocationChange(position);
      /* print("listener funcionando correctamente"); */
      getCordenasAndName();
      /* print("listener funcionando correctamente"); */
    });
  }
}
