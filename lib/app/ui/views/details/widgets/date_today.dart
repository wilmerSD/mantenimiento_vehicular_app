import 'package:app_valtx_asistencia/app/ui/views/details/details_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

final helpers = Helpers();

class DateToday extends StatelessWidget {
  const DateToday({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsController>(builder: (controller) {
      return Obx(() => Container(
          margin: EdgeInsets.symmetric(horizontal: kMarginLargeApp.w),
          width: double.infinity,
          height: kSizeNormalMediun.h,
          child: Text(
            textScaleFactor: 1.2,
            '${controller.day} ${helpers.getMonthName(controller.montInt)} ${controller.age}',
            style: AppTextStyle(context).bold18(
              color: AppColors.primary,
            ),
            textAlign: TextAlign.left,
          )));
    });
  }
}
