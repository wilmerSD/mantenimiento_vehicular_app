import 'dart:convert';

import 'package:app_valtx_asistencia/app/data/temporary/sesion_data_temporary.dart';
import 'package:app_valtx_asistencia/app/local/storage_service.dart';
import 'package:app_valtx_asistencia/app/models/request/request_authentication_model.dart';
import 'package:app_valtx_asistencia/app/repositories/authentication_repository.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/helpers/keys.dart';
import 'package:app_valtx_asistencia/routes/app_routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
/* import 'package:url_launcher/url_launcher.dart'; */

class LoginController extends GetxController {
  @override
  void onInit() {
    _initialize();
    super.onInit();
  }

  //Instances
  final _authenticationRepository = Get.find<AuthenticationRepository>();

  //Variables
  RxString messageError = RxString("");
  RxBool isLoading = false.obs;
  RxBool isVisible = true.obs;
  RxBool isFirstTimeSession = RxBool(false);
  RxBool successCodeVerifided = RxBool(false);

  //TextEditingController
  TextEditingController ctrlEmailText = TextEditingController();
  TextEditingController ctrlPasswordText = TextEditingController();
  TextEditingController textCtrlCodeVerification = TextEditingController();
  TextEditingController textCtrlPasswordNew = TextEditingController();
  TextEditingController textCtrlPasswordToConfirm = TextEditingController();

  //Functions
  /* 📌 Inicializar variables o funciones */
  void _initialize() async {
    ctrlEmailText.text = "";
    ctrlPasswordText.text = "";
  }

  /* 📌 Para hacer visible o no la contraseña */
  void setPrivate() {
    isVisible.value ? isVisible.value = false : isVisible.value = true;
  }

  /* 📌 Validar que los campos del form de cambio de contraseña esten completos antes de hacer la petición */
  void validateForm(BuildContext context) {
    FocusScope.of(context).unfocus();
    if (ctrlEmailText.text.trim() == "" && ctrlPasswordText.text.trim() == "") {
      Helpers.showSnackBar(
        context,
        title: "Validar",
        message: "Por favor, ingrese su usuario y contraseña",
      );
      return;
    }
    if (ctrlEmailText.text.trim() == "") {
      Helpers.showSnackBar(
        context,
        title: "Validar",
        message: "Por favor, ingrese su usuario",
      );
      return;
    }
    if (ctrlPasswordText.text.trim() == "") {
      Helpers.showSnackBar(
        context,
        title: "Validar",
        message: "Por favor, ingrese su contraseña",
      );
      return;
    }
    doAuthentication();
  }

  /* 📌 Petición de autenticación */
  void doAuthentication() async {
    isLoading.value = true;
    try {
      final response = await _authenticationRepository.postAuthentication(
        RequestAuthenticationModel(
          username: ctrlEmailText.text.trim(),
          password: ctrlPasswordText.text.trim(),
        ),
      );

      messageError.value = response.statusMessage;
      if (!response.success) {
        isVisible.value = true;
        Helpers.showSnackBar(
          Get.context!,
          title: "Validar",
          message: "Ups! Ocurrió un error, ${response.statusMessage}",
        );
        return;
      }

      //Guardar la información en sesión
      final bridge = response.data!.token;
      String payloadBase64 = bridge!.split('.')[1];
      SesionDataTemporary.data = jsonDecode(utf8.decode(base64Url.decode(
          payloadBase64.padRight((payloadBase64.length + 3) & ~3, '='))));
      await StorageService.set(key: Keys.kTokenSesion, value: bridge);
      await StorageService.set(
          key: Keys.kUserName, value: ctrlEmailText.text.trim());
      await StorageService.set(
          key: Keys.kPassword, value: ctrlPasswordText.text.trim());

      final idRole = SesionDataTemporary.data["rol"];
      final idUser = SesionDataTemporary.data["id"];
      String firstnames = SesionDataTemporary.data["firstnames"];
      String lastnames = SesionDataTemporary.data["lastnames"];
      String email = SesionDataTemporary.data["email"];
      String fullNamesUser = "$firstnames $lastnames";
      String cip = SesionDataTemporary.data["CIP"];
      await StorageService.set(key: Keys.kIdUser, value: idUser.toString());
      await StorageService.set(key: Keys.kIdRole, value: idRole.toString());
      await StorageService.set(key: Keys.kNameUser, value: fullNamesUser);
      await StorageService.set(key: Keys.kEmail, value: email);
      await StorageService.set(key: Keys.kCip, value: cip);

      //Ir a nueva ruta y eliminar de memoria controllers existentes
      Get.offNamed(AppRoutesName.HOME);
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

  /* 📌 Regresar a login */
  void goToLogin() {
    isFirstTimeSession.value = false;
  }

  /* 📌 Ir a recuperar contraseña */
  void recoverPassword() {
    Get.offNamed(AppRoutesName.RECOVERPASS);
  }

  /* launchWhatsApp() async {
    final Uri url = Uri.parse('https://wa.me/949238476');
    try{
      if (await canLaunchUrl (url)) {
            await launchUrl (url);
      } else {
          throw 'No se pudo abrir WhatsApp';
      }
    }catch(e){
      print("No se pudo conectar a whatsaap");
    }
    
  } */
}
