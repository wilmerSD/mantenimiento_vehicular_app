import 'package:app_valtx_asistencia/app/ui/views/home/home_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserInformation extends StatelessWidget {
  const UserInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) => Container(
            height: kSizeBigTall.h,
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              horizontal: kMarginApp.w,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                kRadiusSmall,
              ),
              color: AppColors.backgroundColor,
              boxShadow: [
                BoxShadow(
                  color: AppColors.grayBlue.withOpacity(0.1),
                  spreadRadius: 4,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Obx(() {
              return controller.isLoadingUser.value
                  ? const Center(child: CircularProgressIndicator())
                  : ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppColors.primary,
                        radius: kRadiusLarge,
                        child: Icon(Icons.person,
                            color: AppColors.backgroundColor,
                            size: kIconSize.h),
                      ),
                      title: Text(
                        textScaleFactor: 1,
                        controller.fullNameUser.value,
                        style: AppTextStyle(context).bold14(
                          color: AppColors.primary,
                        ),
                      ),
                      subtitle: Row(
                        children: [
                          const Icon(Iconsax.location,
                              color: AppColors.grayBlue, size: kIconSizeSmall),
                          SizedBox(width: kSizeLittle.w),
                          Flexible(
                            child: Text(
                              textScaleFactor: 1,
                              controller.nameLocation.value,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyle(context)
                                  .medium12(color: AppColors.grayBlue),
                            ),
                          ),
                        ],
                      ),
                    );
            })));
  }
}
