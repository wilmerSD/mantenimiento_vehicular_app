import 'dart:ui';

import 'package:app_valtx_asistencia/app/ui/components/alerts/alert_register_bad.dart';
import 'package:app_valtx_asistencia/app/ui/components/alerts/alert_register_good.dart';
import 'package:app_valtx_asistencia/app/ui/components/btn_primary_ink.dart';
import 'package:app_valtx_asistencia/app/ui/views/home/widgets/map_view.dart';
import 'package:app_valtx_asistencia/app/ui/views/home/widgets/appBar_home.dart';
import 'package:app_valtx_asistencia/app/ui/views/home/widgets/user_information.dart';
import 'package:app_valtx_asistencia/app/ui/views/home/home_controller.dart';
import 'package:app_valtx_asistencia/app/ui/views/home/widgets/drawer_menu_app.dart';
import 'package:app_valtx_asistencia/app/ui/views/home/widgets/list_type_mark.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: const DrawerMenuApp(),
        body: Stack(
          children: [
            Container(child: const MapView()),
            Center(
              child: Column(
                children: [
                  //Detalles
                  const AppBarHome(),
                  Expanded(
                      child: SizedBox(
                    height: kSizeLittle.h,
                  )),
                  //Asistencias de la semana
                  /* const ContentWeekHome(), */
                  SizedBox(height: 12.h),
                  //Información del usuario
                  const UserInformation(),
                  SizedBox(height: 12.h),
                  /* DashedLine(
                    dashWidth: 5.0,
                    dashGap: 5.0,
                    color: AppColors.grayBlue,
                    width: double.infinity,
                    height: 1.0,
                    margin: EdgeInsets.symmetric(horizontal: kMarginMediunApp.w),
                  ), */
                  /* const BottomHome(), */
                  //Para marcar asistencia
                  Obx(
                    () => Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: kMarginMediunApp.w),
                      child: BtnPrimaryInk(
                        text: controller.isLoading.value
                            ? "Registrando..."
                            : "Marcar",
                        loading: controller.isLoading.value,
                        onTap: () {
                          /* -helpers.showTypesMarkingDialog(context, controller); */
                          Helpers.getShowModalBS(context,
                              title: 'Seleccionar tipo de marcación',
                              content: const ListTypeMark());
                          /* controller.getCurrentLocation();
                          controller.getNameLocation(); */
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: kSizeNormalLittle.h,
                  ),
                ],
              ),
            ),
            Obx(() {
              return controller.statusAssistance.value
                  ? Positioned(
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                          child:
                              Container(color: Colors.black.withOpacity(0.85)),
                        ),
                      ),
                    )
                  : const SizedBox.shrink();
            }),
            Obx(() {
              return !controller.statusAssistanceSecond.value
                  ? Positioned(
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                          child:
                              Container(color: Colors.black.withOpacity(0.85)),
                        ),
                      ),
                    )
                  : const SizedBox.shrink();
            }),
            Obx(() => controller.statusAssistance.value
                ? const AlertRegisterGood()
                : controller.statusAssistanceSecond.value
                    ? const SizedBox()
                    : AlertRegisterBad()),
          ],
        ),
      ),
    );
  }
}
