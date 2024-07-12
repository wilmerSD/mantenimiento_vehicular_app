import 'package:app_valtx_asistencia/app/ui/components/btn_primary_ink.dart';
import 'package:app_valtx_asistencia/app/ui/components/field_form.dart';
import 'package:app_valtx_asistencia/app/ui/views/login/login_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangeFirstPass extends StatelessWidget {
  const ChangeFirstPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _image = AssetImage('assets/reunion.jpg');
    precacheImage(_image, context);

    return GetBuilder<LoginController>(builder: (controller) {
      /* 📌 Input de código de verificación */
      Widget inputCode = FieldForm(
        label: "Código de verifcación",
        hintText: "123456",
        textInputType: TextInputType.emailAddress,
        textEditingController: controller.textCtrlCodeVerification,
      );

      /* 📌 Input de password */
      Widget inputPass = Obx(
        () => FieldForm(
          label: "Nueva contraseña",
          privateText: controller.isVisible.value,
          suffix: GestureDetector(
            onTap: () {
              controller.setPrivate();
            },
            child: Icon(
                controller.isVisible.value ? Iconsax.eye : Iconsax.eye_slash),
          ),
          textEditingController: controller.textCtrlPasswordNew,
        ),
      );

      /* 📌 Input password verificación */
      Widget inputSecondPass = Obx(
        () => FieldForm(
          label: "Repetir nueva contraseña",
          privateText: controller.isVisible.value,
          suffix: GestureDetector(
            onTap: () {
              controller.setPrivate();
            },
            child: Icon(
                controller.isVisible.value ? Iconsax.eye : Iconsax.eye_slash),
          ),
          textEditingController: controller.textCtrlPasswordToConfirm,
        ),
      );

      /* 📌 btn para enviar código de verificación */
      Widget getCodeVerification = Obx(() => BtnPrimaryInk(
            text: controller.isLoading.value ? "Enviando..." : "Obtener código",
            loading: controller.isLoading.value,
            onTap: () => controller.validateForm(context),
          ));

      /* 📌 btn para enviar código de verificación */
      Widget sendCodeVerification = Obx(() => BtnPrimaryInk(
            text: controller.isLoading.value ? "Verificando..." : "Confirmar",
            loading: controller.isLoading.value,
            onTap: () => controller.validateForm(context),
          ));

      /* 📌 btn para cambiar la contraseña */
      Widget btnChangePass = Obx(() => BtnPrimaryInk(
            text: controller.isLoading.value ? "Verificando..." : "Cambiar",
            loading: controller.isLoading.value,
            onTap: () => controller.validateForm(context),
          ));

      /* 📌 btn para regresar a login */
      Widget backLogin = InkWell(
          onTap: () {
            controller.goToLogin();
          },
          child: const Padding(
            padding: EdgeInsets.all(12),
            child: Text('Regresar a login',
                style: TextStyle(
                    color: AppColors.blueRecoverPass,
                    fontWeight: FontWeight.w900,
                    fontSize: 14)),
          ));

      return /* Responsive.isDesktop(context) || Responsive.isTablet(context) ? */
          Align(
              alignment: const Alignment(1, 1),
              child: Flex(
                  mainAxisAlignment: MainAxisAlignment.center,
                  direction: Axis.values[1],
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kMarginExtraBigApp),
                      width: 550,
                      /* width: double.infinity, */
                      height: 500,
                      decoration: const BoxDecoration(
                        color: AppColors.backgroundColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(kRadiusNormal),
                        ),
                      ),
                      child: Column(
                        children: [
                          Obx(() => controller.successCodeVerifided.value
                              ? Column(
                                  children: [
                                    SizedBox(
                                      height: kSizeExtraLittle.h,
                                    ),
                                    const Text(
                                      "Cambiar contraseña",
                                      style: TextStyle(
                                          color: AppColors.primary,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: kSizeExtraLittle.h,
                                    ),
                                    inputPass,
                                    SizedBox(
                                      height: kSizeExtraLittle.h,
                                    ),
                                    inputSecondPass,
                                    SizedBox(
                                      height: kSizeExtraLittle.h,
                                    ),
                                    btnChangePass,
                                    SizedBox(
                                      height: kSizeExtraLittle.h,
                                    ),
                                    backLogin
                                  ],
                                )
                              : Column(
                                  children: [
                                    SizedBox(
                                      height: kSizeExtraLittle.h,
                                    ),
                                    const Text(
                                      "Verificación de código",
                                      style: TextStyle(
                                          color: AppColors.primary,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: kSizeExtraLittle.h,
                                    ),
                                    const Text(
                                      "Para mayor seguridad, hemos enviado un código a tu correo",
                                      style: TextStyle(
                                          color: AppColors.primary,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: kSizeExtraLittle.h,
                                    ),
                                    inputCode,
                                    SizedBox(
                                      height: kSizeExtraLittle.h,
                                    ),
                                    sendCodeVerification,
                                    SizedBox(
                                      height: kSizeExtraLittle.h,
                                    ),
                                    backLogin
                                  ],
                                )),
                        ],
                      ),
                    ),
                  ]));
    });
  }
}
