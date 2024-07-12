import 'package:app_valtx_asistencia/app/ui/views/schedule/schedule_controller.dart';
import 'package:app_valtx_asistencia/app/ui/views/schedule/widgets/container_schedule.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ScheduleView extends StatelessWidget {
  const ScheduleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScheduleController>(
        builder: (controller) => Scaffold(
            backgroundColor: AppColors.graySchedule,
            appBar: AppBar(
              toolbarHeight: kSizeNormalLarge.h,
              elevation: 0.18,
              iconTheme: const IconThemeData(color: AppColors.primary),
              backgroundColor: AppColors.backgroundColor,
              title: Text(
                'Mi horario',
                style: AppTextStyle(context).extra20(
                  color: AppColors.primary,
                ),
              ),
            ),
            body: Obx(() => controller.isLoadingSchedule.value
                ? const Center(child: CircularProgressIndicator())
                : controller.scheduleByUserSuccess.value
                    ? const ScheduleUser()
                    : const SizedBox.shrink())));
  }
}
