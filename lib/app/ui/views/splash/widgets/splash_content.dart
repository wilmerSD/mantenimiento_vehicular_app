import 'package:app_valtx_asistencia/app/ui/views/splash/splash_controller.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        builder: (controller) => Container(
              decoration: const BoxDecoration(color: AppColors.light),
              child: Center(
                  child: Text('Harkay',
                      style: AppTextStyle(context).extra40(
                        color: AppColors.blueDark,

                      )),
                      ),
            ));
  }
}
