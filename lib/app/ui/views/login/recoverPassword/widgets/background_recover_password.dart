import 'package:app_valtx_asistencia/app/ui/components/btn_primary_ink.dart';
import 'package:app_valtx_asistencia/app/ui/components/field_form.dart';
import 'package:app_valtx_asistencia/app/ui/views/login/recoverPassword/recover_password_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BackgroundRecoverPassword extends StatelessWidget {
  const BackgroundRecoverPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _image = AssetImage('assets/reunion.jpg');

    return GetBuilder<RecoverPasswordController>(builder: (controller) {
      /*📌 Widget Usuario  */
      Widget inputUser = FieldForm(
        textEditingController: controller.textCtrlUser,
        label: "Usuario",
        hintText: "Ingrese usuario",
        onChanged: (value) => controller.errorTextEmail.value = "",
      );

      /* 📌 Input de código de verificación */
      Widget inputEmail = FieldForm(
        label: "Correo electrónico",
        hintText: "Ingrese correo electrónico",
        textInputType: TextInputType.emailAddress,
        textEditingController: controller.textCtrlEmail,
      );

      /* 📌 Input de código de verificación */
      Widget inputCode = FieldForm(
        label: "Código de verificación",
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
          textEditingController: controller.textCtrlPassword,
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
            onTap: () => controller.validateEmail(context),
          ));

      /* 📌 btn para enviar código de verificación */
      Widget sendCodeVerification = Obx(() => BtnPrimaryInk(
            text: controller.isLoading.value ? "Verificando..." : "Confirmar",
            loading: controller.isLoading.value,
            onTap: () => controller.validateCode(context),
          ));

      /* 📌 btn para cambiar la contraseña */
      Widget btnChangePass = Obx(() => BtnPrimaryInk(
            text: controller.isLoading.value ? "Verificando..." : "Cambiar",
            loading: controller.isLoading.value,
            onTap: () => controller.validatePass(context),
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
          Scaffold(
              backgroundColor: AppColors.backgroundColor,
              body: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Stack(children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 800,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.grayBlue.withOpacity(0.4),
                                spreadRadius: 4,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                            image: DecorationImage(
                              image: _image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: kMarginLargeApp),
                            width: double.infinity,
                            height: kSizeBigAmple.h,
                            decoration: const BoxDecoration(
                              color: AppColors.backgroundColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(kRadiusNormal),
                                topRight: Radius.circular(kRadiusNormal),
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
                                    : controller.successRespondCode.value
                                        ? Column(
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
                                          )
                                        : Column(
                                            children: [
                                              SizedBox(
                                                height: kSizeExtraLittle.h,
                                              ),
                                              Text(
                                                textScaleFactor: 1.2,
                                                "Vamos a ayudarte a iniciar sesión",
                                                style: TextStyle(
                                                    color: AppColors.primary,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20.sp),
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(
                                                height: kSizeExtraLittle.h,
                                              ),
                                              Text(
                                                textScaleFactor: 1.2,
                                                "Indicanos la siguiente información para recuperar tu contraseña ",
                                                style: TextStyle(
                                                    color: AppColors.primary,
                                                    fontSize: 14.sp),
                                              ),
                                              SizedBox(
                                                height: kSizeExtraLittle.h,
                                              ),
                                              inputEmail,
                                              SizedBox(
                                                height: kSizeExtraLittle.h,
                                              ),
                                              getCodeVerification,
                                              SizedBox(
                                                height: kSizeExtraLittle.h,
                                              ),
                                              backLogin
                                            ],
                                          )),
                              ],
                            ))),
                    Positioned(
                      top: 0.0,
                      right: 15.0,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Obx(() => Visibility(
                            visible: controller.showToast.value,
                            child: controller.toast)),
                      ),
                    ),
                  ])));
      /*  : Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.9,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/img/banner-bg4.png"),
                    fit: BoxFit.fill),
              ),
            ); */
    });
  }
}
