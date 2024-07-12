import 'package:app_valtx_asistencia/app/ui/components/alert_dialog_component.dart';
import 'package:app_valtx_asistencia/app/ui/views/home/home_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class DrawerMenuApp extends GetView<HomeController> {
  const DrawerMenuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: kPaddingAppLargeApp.w,
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: AppColors.primary,
                radius: kRadiusLarge,
                child: Icon(Icons.person,
                    color: AppColors.backgroundColor, size: kIconSize.h),
              ),
              SizedBox(height: kSize.h),
              Text(
                "Hola,",
                style: AppTextStyle(context).medium14(
                  color: AppColors.primary,
                ),
              ),
              Obx(
                () => Text(
                  controller.fullNameUser.value,
                  style: AppTextStyle(context).bold18(
                    color: AppColors.primary,
                  ),
                ),
              ),
              SizedBox(height: kSize.h),
              const Divider(color: AppColors.grayLight),
              ListTile(
                onTap: () => controller.navigateToSchedule(),
                contentPadding: EdgeInsets.zero,
                leading: Icon(
                  Iconsax.calendar,
                  size: kIconSizeSmall.h,
                  color: AppColors.primary,
                ),
                title: Text(
                  "Mi horario",
                  style: AppTextStyle(context).medium14(
                    color: AppColors.primary,
                  ),
                ),
              ),
              /* SizedBox(height: kSize.h), */
              const Divider(color: AppColors.grayLight),
              ListTile(
                onTap: () => controller.navigateToScreen(),
                contentPadding: EdgeInsets.zero,
                leading: Icon(
                  Iconsax.receipt,
                  size: kIconSizeSmall.h,
                  color: AppColors.primary,
                ),
                title: Text(
                  "Registro de solicitudes",
                  style: AppTextStyle(context).medium14(
                    color: AppColors.primary,
                  ),
                ),
              ),
              const Divider(color: AppColors.grayLight),
              ListTile(
                onTap: () => controller.navigateToChangePass(),
                contentPadding: EdgeInsets.zero,
                leading: Icon(
                  Iconsax.lock,
                  size: kIconSizeSmall.h,
                  color: AppColors.primary,
                ),
                title: Text(
                  "Cambiar contraseña",
                  style: AppTextStyle(context).medium14(
                    color: AppColors.primary,
                  ),
                ),
              ),
              /* const Divider(color: AppColors.grayLight),
              ListTile(
                onTap: () => controller.navigateToScreen2(),
                contentPadding: EdgeInsets.zero,
                leading: Icon(
                  Iconsax.folder,
                  size: kIconSizeSmall.h,
                  color: AppColors.primary,
                ),
                title: Text(
                  "Bandeja de solicitudes",
                  style: AppTextStyle(context).medium14(
                    color: AppColors.primary,
                  ),
                ),
              ), */
              const Spacer(),
              ListTile(
                onTap: () {
                  Get.dialog(AlertDialogComponent(
                      headerTitle: "Cerrar sesión",
                      title: "¿Quieres salir del $ktittleSistem?",
                      onTapButton: () async {
                        await controller.loginout();
                      },
                      textPrimaryButton: "Sí",
                      textSecondaryButton: "No",
                      onTapButtonSecondary: () {
                        Get.back();
                      }));
                } /* => controller.loginout() */,
                contentPadding: EdgeInsets.zero,
                leading: Icon(
                  Iconsax.logout,
                  size: kIconSizeSmall.h,
                  color: AppColors.primary,
                ),
                title: Text(
                  "Cerrar sesión",
                  style: AppTextStyle(context).medium14(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
