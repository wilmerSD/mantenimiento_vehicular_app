import 'package:app_valtx_asistencia/app/ui/components/input_primary.dart';
import 'package:app_valtx_asistencia/app/ui/views/permission/permission_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class VacationIndicators extends StatelessWidget {
  const VacationIndicators({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PermissionController>(
        init: PermissionController(),
        builder: (controller) {
          //Elements
          /*📌 Widget para ver días truncos */
          Widget truncatedDay = InputPrimary(
            textEditingController: controller.truncatedDay,
            label: "Días truncos",
            onChanged: (value) => controller.truncatedDay.value,
            isActive: false,
          );

          /*📌 Widget para ver días pendientes */
          Widget pendingDay = InputPrimary(
            textEditingController: controller.pendingDay,
            label: "Días pendientes",
            onChanged: (value) => controller.pendingDay.value,
            isActive: false,
          );

          /*📌 Widget para ver días vencidos */
          Widget expiredDay = InputPrimary(
            textEditingController: controller.expiredDay,
            label: "Días vencidos",
            onChanged: (value) => controller.expiredDay.value,
            isActive: false,
          );

          /*📌 Widget para ver fecha de derecho */
          Widget lawDay = InputPrimary(
            textEditingController: controller.lawDay,
            label: "Fecha de derecho",
            onChanged: (value) => controller.lawDay.value,
            isActive: false,
          );

          return Container(
            
            padding: const EdgeInsets.symmetric(
                vertical: kPaddingAppNormalApp,
                horizontal: kPaddingAppLargeApp),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kRadiusMedium),
              color: AppColors.contentNotification,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.info_outline,
                      color: Colors.black,
                      size: 40.0,
                    ),
                    FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text("Informacíon vacacional",
                            style: AppTextStyle(context).bold16())),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: truncatedDay),
                    SizedBox(width: kSizeExtraMediun.w),
                    Expanded(child: pendingDay),
                  ],
                ),
                SizedBox(height: kSizeNormalLittle.h),
                Row(
                  children: [
                    Expanded(child: expiredDay),
                    SizedBox(width: kSizeExtraMediun.w),
                    Expanded(child: lawDay),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
