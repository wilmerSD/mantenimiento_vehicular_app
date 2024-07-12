import 'package:app_valtx_asistencia/app/ui/components/btn_cancel.dart';
import 'package:app_valtx_asistencia/app/ui/components/btn_primary.dart';
import 'package:app_valtx_asistencia/app/ui/components/input_primary.dart';
import 'package:app_valtx_asistencia/app/ui/views/changepass/changepass_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangePassView extends StatelessWidget {
  const ChangePassView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangePassController>(builder: (controller) {
      /* 📌 Información del usuario(nombres y apellidos) */
      Widget user = InputPrimary(
        isActive: false,
        label: "Nombres y apellidos",
        textEditingController: controller.fullNamesUser,
      );

      /* 📌 Email del usuario */
      Widget email = InputPrimary(
        label: "Correo",
        isActive: false,
        textEditingController: controller.emailString,
      );

      /* 📌 Input de nueva contraseña */
      Widget newPassword = Obx(
        () => InputPrimary(
          privateText: controller.isVisible.value,
          label: "Nueva contraseña",
          textEditingController: controller.newPassword,
          suffix: GestureDetector(
            onTap: () {
              
              controller.setPrivate();
            },
            child: Icon(
              controller.isVisible.value ? Iconsax.eye : Iconsax.eye_slash,
              color: AppColors.blueDark,
            ),
          ),
        ),
      );

      /* 📌 Input de nueva contraseña-repetir */
      Widget againNewPassword = Obx(
        () => InputPrimary(
          privateText: controller.isVisible.value,
          label: "Repetir nueva contraseña",
          textEditingController: controller.againNewPassword,
          suffix: GestureDetector(
            onTap: () {
              controller.setPrivate();
            },
            child: Icon(
              controller.isVisible.value ? Iconsax.eye : Iconsax.eye_slash,
              color: AppColors.blueDark,
            ),
          ),
          validator: (value) {
            return Helpers.comparePassword(
              controller.newPassword.text,
              controller.againNewPassword.text,
            );
          },
        ),
      );

      /* 📌 Boton para cambiar contraseña */
      Widget btnChangePassword = Obx(
        () => BtnPrimary(
          isMaxHeight: true,
          onTap: () async {
            if (controller.newPassword.text !=
                controller.againNewPassword.text) {
              Helpers.comparePassword(
                controller.newPassword.text,
                controller.againNewPassword.text,
              );
            }
            controller.validateForm(context);
          },
          text: controller.isLoading.value ? "Cambiando..." : "Cambiar",
          child: controller.isLoading.value
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : null,
        ),
      );

      /* 📌 Para limpiar variables de contraseña */
      Widget cleanPasswords = BtnCancel(
        onTap: () {
          controller.cleanPass();
        },
        text: "Limpiar",
      );

      return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          toolbarHeight: kSizeNormalLarge.h,
          elevation: 0.18,
          iconTheme: const IconThemeData(color: AppColors.primary),
          backgroundColor: AppColors.backgroundColor,
          title: Text(
            'Cambiar contraseña',
            style: AppTextStyle(context).extra20(
              color: AppColors.primary,
            ),
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: ListView(
                  padding: const EdgeInsets.all(kMarginNormalApp),
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: kPaddingAppNormalApp.h),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(246, 246, 246, 100),
                          borderRadius: BorderRadius.circular(kRadiusSmall.h),
                        ),
                        child: user),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: kPaddingAppNormalApp.h),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(246, 246, 246, 100),
                          borderRadius: BorderRadius.circular(kRadiusSmall.h),
                        ),
                        child: email),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: kPaddingAppNormalApp.h),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(246, 246, 246, 100),
                          borderRadius: BorderRadius.circular(kRadiusSmall.h),
                        ),
                        child: newPassword),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: kPaddingAppNormalApp.h),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(246, 246, 246, 100),
                          borderRadius: BorderRadius.circular(kRadiusSmall.h),
                        ),
                        child: againNewPassword),
                    const SizedBox(
                      height: 30.0,
                    ),
                    cleanPasswords,
                    const SizedBox(
                      height: 30.0,
                    ),
                    btnChangePassword,
                    const SizedBox(),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
