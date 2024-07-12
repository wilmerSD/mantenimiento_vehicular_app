import 'package:app_valtx_asistencia/app/ui/views/login/recoverPassword/recover_password_controller.dart';
import 'package:app_valtx_asistencia/app/ui/views/login/recoverPassword/widgets/background_recover_password.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecoverPasswordView extends StatelessWidget {
  const RecoverPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecoverPasswordController>(
      builder: (controller) => const Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: BackgroundRecoverPassword()),
    );
  }
}
