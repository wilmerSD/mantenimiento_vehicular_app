/* import 'package:app_valtx_asistencia/app/ui/components/button/btn_primary.dart';
import 'package:app_valtx_asistencia/app/ui/components/input_primary.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecoverPassword extends StatelessWidget {
  const RecoverPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecoverPasswordController>(builder: (controller) {
      final keyForm = GlobalKey<FormState>();
      //ELEMENTS

      /*📌 Widget Usuario  */
      Widget inputUser = InputPrimary(
        textEditingController: controller.textCtrlUser,
        icon: const Icon(Icons.person_2),
        label: "Usuario",
        hintText: "Ingrese usuario",
        onChanged: (value) => controller.errorTextEmail.value = "",
        validator: (value) {
          return Helpers.simpleRequired(value);
        },
      );

      /*📌 Widget Correo electrónico  */
      Widget inputEmail = InputPrimary(
        textEditingController: controller.textCtrlEmail,
        icon: const Icon(Icons.email),
        label: "Correo electrónico",
        hintText: "Ingrese correo electrónico",
        onChanged: (value) => controller.errorTextEmail.value = "",
        validator: (value) {
          return Helpers.simpleRequired(value);
        },
      );

      /*📌 Widget boton recuperar  */
      Widget btnRecover = Obx(
        () => BtnPrimary(
          isMaxHeight: true,
          onTap: () {
            if (keyForm.currentState!.validate()) {
              controller.recoverPass();
            }
          },
          text: controller.isLoading.value ? "Verificando..." : "Recuperar",
          child: controller.isLoading.value
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : null,
        ),
      );

      /*📌 Widget boton Login  */
      Widget login = InkWell(
          onTap: () {
            controller.goToLogin();
          },
          child: const Padding(
            padding: EdgeInsets.all(12),
            child: Text('Iniciar sesión',
               /*  style: TextStyle(
                    color: AppColors.secondLinkBlue,
                    fontWeight: FontWeight.w900,
                    fontSize: 14) */),
          ));

      /*📌 Widget de entrada de codigo de verificación  */
      Widget inputCode = InputPrimary(
        textEditingController: controller.textCtrlCodeVerification,
        icon: const Icon(Icons.admin_panel_settings_outlined),
        label: "Código",
        hintText: "Ingrese código",
        onChanged: (value) => controller.errorTextEmail.value = "",
        validator: (value) {
          return Helpers.simpleRequired(value);
        },
      );

      /*📌 Widget de entrada nueva contraseña  */
      Widget inputPassword = Obx(
        () => InputPrimary(
          autofocus: true,
          onEditingComplete: () {
            if (keyForm.currentState!.validate()) {
              //controller.doAuth();
            }
          },
          privateText: controller.isObscureText.value,
          textEditingController: controller.textCtrlPassword,
          icon: const Icon(Icons.https),
          label: "Nueva contraseña",
          hintText: "Ingrese contraseña",
          onChanged: (value) => controller.errorTextPassword.value = "",
          validator: (value) {
            return Helpers.simpleRequired(value);
          },
          suffix: InkWell(
            onTap: () {
              controller.isObscureText.value = !controller.isObscureText.value;
            },
            child: controller.isObscureText.value
                ? HelpersComponents.pathAssetIcons(
                    "eye.png", AppColors.primaryBlue)
                : HelpersComponents.pathAssetIcons(
                    "eye-slash.png", AppColors.primaryBlue),
          ),
        ),
      );

      /*📌 Widget de entrada de confirmación de contraseña  */
      Widget inputPasswordToConfirm = Obx(
        () => InputPrimary(
          autofocus: true,
          onEditingComplete: () {
            if (keyForm.currentState!.validate()) {
              //controller.doAuth();
            }
          },
          privateText: controller.isObscureText.value,
          textEditingController: controller.textCtrlPasswordToConfirm,
          icon: const Icon(Icons.https),
          label: "Confirmar contraseña",
          hintText: "Ingrese contraseña",
          //onChanged: (value) => controller.errorTextPassword.value = "",
          validator: (value) {
            return Helpers.completeValidatePasssword(
                controller.textCtrlPasswordToConfirm.text,
                controller.textCtrlPassword.text,
                value);
          },
          suffix: InkWell(
            onTap: () {
              controller.isObscureText.value = !controller.isObscureText.value;
            },
            child: controller.isObscureText.value
                ? HelpersComponents.pathAssetIcons(
                    "eye.png", AppColors.primaryBlue)
                : HelpersComponents.pathAssetIcons(
                    "eye-slash.png", AppColors.primaryBlue),
          ),
        ),
      );

      /*📌 Widget boton confirmar codigo */
      Widget btnConfirm = Obx(
        () => BtnPrimary(
          isMaxHeight: true,
          onTap: () {
            if (keyForm.currentState!.validate()) {
              controller.sendCodeVerification();
            }
          },
          text: controller.isLoading.value ? "Verificando..." : "Confirmar",
          child: controller.isLoading.value
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : null,
        ),
      );

      /*📌 Widget boton cambiar contraseña */
      Widget btnChangePassword = Obx(
        () => BtnPrimary(
          isMaxHeight: true,
          onTap: () {
            if (controller.textCtrlPasswordToConfirm.text !=
                controller.textCtrlPassword.text) {
              //Asegurese que su contraseña sean identicas
            } else if (keyForm.currentState!.validate()) {
              controller.sendChangePassword();
            }
          },
          text: controller.isLoading.value ? "Verificando..." : "Cambiar",
          child: controller.isLoading.value
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : null,
        ),
      );

      Widget telefonicaBlue = Container(
        height: 90.0,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/img/telefonito.png"),
              fit: BoxFit.contain),
          color: Colors.transparent,
        ),
      );
      //Vista
      return Responsive.isDesktop(context) || Responsive.isTablet(context)
          ? Expanded(
              flex: 10,
              child: Stack(
                children: [
                  Container(
                    //width: MediaQuery.of(context).size.width * 0.41,
                    width: widthSpace(context),
                    padding: const EdgeInsets.only(
                        bottom: 10.0, right: 50.0, left: 50.0),
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: AppColors.shadowColor,
                            offset: Offset(0, 40),
                            blurRadius: 40.0,
                            spreadRadius: 5.0)
                      ],
                      color: const Color.fromARGB(221, 239, 239, 240),
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    child: Form(
                      key: keyForm,
                      child: Column(
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          Obx(() {
                            return controller.successRespondEmail.value
                                ? Obx(() => controller.successRespondCode.value
                                    ? Column(
                                        children: [
                                          telefonicaBlue,
                                          const Text(
                                            "Cambiar contraseña",
                                            style: TextStyle(
                                                color: AppColors.secondLinkBlue,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                            textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(height: 30.0),
                                          Container(child: inputPassword),
                                          const SizedBox(height: 30.0),
                                          Container(
                                              child: inputPasswordToConfirm),
                                          const SizedBox(height: 40.0),
                                          btnChangePassword,
                                          const SizedBox(height: 30.0),
                                          Container(child: login),
                                          const SizedBox(height: 30.0),
                                        ],
                                      )
                                    : Column(
                                        children: [
                                          telefonicaBlue,
                                          const Text(
                                            "Verificación de código",
                                            style: TextStyle(
                                                color: AppColors.secondLinkBlue,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                            textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(height: 20.0),
                                          const Text(
                                            "Para mayor seguridad, hemos enviado un código a tu correo",
                                            style: TextStyle(
                                                color: AppColors.secondLinkBlue,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                            textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(height: 30.0),
                                          Container(child: inputCode),
                                          const SizedBox(height: 30.0),
                                          btnConfirm,
                                          const SizedBox(height: 30.0),
                                          Container(child: login),
                                          const SizedBox(height: 30.0),
                                        ],
                                      ))
                                : Column(
                                    children: [
                                      telefonicaBlue,
                                      const Text(
                                        "Vamos a ayudarte a iniciar sesión",
                                        style: TextStyle(
                                            color: AppColors.secondLinkBlue,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(height: 20.0),
                                      const Text(
                                        "Indicanos la siguiente información para recuperar tu contraseña ",
                                        style: TextStyle(
                                            color: AppColors.secondLinkBlue,
                                            fontSize: 14),
                                      ),
                                      const SizedBox(height: 30.0),
                                      Container(child: inputUser),
                                      const SizedBox(height: 30.0),
                                      Container(child: inputEmail),
                                      const SizedBox(height: 30.0),
                                      btnRecover,
                                      const SizedBox(height: 30.0),
                                      Container(child: login),
                                      const SizedBox(height: 30.0)
                                    ],
                                  );
                          })
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Responsive.isTablet(context)
              ? Container(
                  width: MediaQuery.of(context).size.width * 0.90,
                )
              /////////// AQUI COMIENZA MOVIL/////////////////////
              : Column(
                  children: [
                    const Expanded(flex: 4, child: SizedBox()),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.90,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 50.0),
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: AppColors.shadowColor,
                              offset: Offset(0, 40),
                              blurRadius: 40.0,
                              spreadRadius: 5.0)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: Form(
                        key: keyForm,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Gestión de visitas",
                              style: AppTextStyle(context).bold32(),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 50.0,
                            ),
                            inputUser,
                            const SizedBox(height: 30.0),
                            inputEmail,
                            const SizedBox(height: 40.0),
                            btnRecover,
                            const SizedBox(height: 30.0),
                            login,
                            const SizedBox(height: 30.0),
                          ],
                        ),
                      ),
                    ),
                    const Expanded(child: SizedBox())
                  ],
                );
    });
  }

  double widthSpace(BuildContext context) {
    if (Responsive.isDesktop(context)) {
      return MediaQuery.of(context).size.width * 0.41;
    }
    if (Responsive.isTablet(context)) {
      return MediaQuery.of(context).size.width * 0.60;
    } else {
      return MediaQuery.of(context).size.width * 0.90;
    }
  }
}
 */