import 'package:app_valtx_asistencia/app/ui/components/alert_dialog_component.dart';
import 'package:app_valtx_asistencia/app/ui/views/home/home_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlertRegisterBad extends StatelessWidget {
  const AlertRegisterBad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Obx(
        () {
          return AlertDialogComponent(
            title: "Información sobre el registro",
            headerTitle: "Información",
            onTapButton: () {
              Get.back();
              controller.statusAssistanceSecond.value = true;
            },
            isOnlyPrimary: true,
            textPrimaryButton: "OK",
            widgetContent: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  controller.statusMessageUserAssistance.value,
                  textScaleFactor: 1,
                  textAlign: TextAlign.justify,
                  style: AppTextStyle(context).medium12(
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(height: kSizeSmallLittle.h),
                Text(
                  'De tener algún inconveniente comuníquese con el área de RRHH.',
                  textScaleFactor: 1,
                  textAlign: TextAlign.left,
                  style: AppTextStyle(context).medium12(
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
