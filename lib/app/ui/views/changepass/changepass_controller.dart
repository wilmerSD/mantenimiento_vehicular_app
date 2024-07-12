import 'package:app_valtx_asistencia/app/local/storage_service.dart';
import 'package:app_valtx_asistencia/app/models/request/request_changepass_model.dart';
import 'package:app_valtx_asistencia/app/models/response/response_user_information_model.dart';
import 'package:app_valtx_asistencia/app/repositories/user_repositori.dart';
import 'package:app_valtx_asistencia/app/ui/components/alert_dialog_component.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/helpers/keys.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:app_valtx_asistencia/routes/app_routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChangePassController extends GetxController {
  @override
  void onInit() {
    _initialize();
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

  /* @override
  void dispose() {} */

  //INSTANCES
  final _userRepository = Get.find<UserRepository>();

  //VARIABLES
  TextEditingController fullNamesUser = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController againNewPassword = TextEditingController();

  RxBool isLoading = false.obs;
  var responseUserInformation = DataUser().obs;
  RxString statusMessageUserInformation = RxString("");
  String idUser = '';
  int idUserInt = 0;
  RxBool isVisible = true.obs;
  TextEditingController emailString = TextEditingController();

  //FUNCTIONS
  /* 📌 Para inicializar variables */
  void _initialize() async {
    await getInfoUserLocal();
  }

  /* 📌 Obtener datos local usuario */
  Future<void> getInfoUserLocal() async {
    fullNamesUser.text = await StorageService.get(Keys.kNameUser);
    idUser = await StorageService.get(Keys.kIdUser);
    idUserInt = int.parse(idUser);
    emailString.text = await StorageService.get(Keys.kEmail);
    /* emailString.text = SesionDataTemporary.data["email"]; */
  }

  /* 📌 Obtener información del usuario */
  void validateForm(BuildContext context) {
    FocusScope.of(context).unfocus();
    if (newPassword.text.trim() == "" || againNewPassword.text.trim() == "") {
      Helpers.showSnackBar(
        context,
        title: "Validar",
        message: "Por favor, ingrese una contraseña",
      );
      return;
    }
    changePassword();

  }

  /* 📌 Obtener información del usuario */
  Future<void> changePassword() async {
    try {
      final response =
          await _userRepository.changePassword(RequestChangePassModel(
        idUser: idUserInt,
        password: newPassword.text,
      ));
      if (!response.success) {
        /* print("aqui"); */
        /* Get.dialog(AlertDialogComponent(
          title: "Información sobre cambio de contraseña",
          headerTitle: "Información",
          onTapButton: () async {
            Get.back();
          },
          widgetContent: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(response.data ?? '',
                  textScaleFactor: 1,
                  textAlign: TextAlign.center,
                  style: AppTextStyle(Get.context!).semi14(
                    color: AppColors.primary,
                  )),
              SizedBox(
                height: kSizeSmallLittle.h,
              ),
            ],
          ),
          isOnlyPrimary: true,
          textPrimaryButton: "OK",
        )); */
        Helpers.showSnackBar(Get.context!,
            title: "Validar", message: response.data ?? '');
        return;
      }
      Helpers.showSnackBarSuccess(Get.context!,
          title: "Validar", message: response.data ?? '');

      /* Get.dialog(AlertDialogComponent(
        title: "Información sobre cambio de contraseña",
        headerTitle: "Información",
        onTapButton: () async {
          loginout();
        },
        widgetContent: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(response.data ?? '',
                textScaleFactor: 1,
                textAlign: TextAlign.center,
                style: AppTextStyle(Get.context!).semi14(
                  color: AppColors.primary,
                )),
            SizedBox(
              height: kSizeSmallLittle.h,
            ),
          ],
        ),
        isOnlyPrimary: true,
        textPrimaryButton: "OK",
      )); */
      cleanPass();
      Future.delayed(const Duration(seconds: 2), () {
        loginout();
      });
    } catch (e) {
      Helpers.showSnackBar(
        Get.context!,
        title: "Validar",
        message: Helpers.knowTypeError(e.toString()),
      );
    } finally {}
  }

  void cleanPass() {
    newPassword.text = '';
    againNewPassword.text = '';
  }

  RxBool showToast = RxBool(false);
  Widget toast = const SizedBox();

  void setPrivate() {
    isVisible.value ? isVisible.value = false : isVisible.value = true;
  }

  //loginout
  loginout() async {
    await StorageService.deleteAll();
    Get.offAllNamed(AppRoutesName.LOGIN);
  }
}
