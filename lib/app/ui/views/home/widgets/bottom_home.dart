import 'package:app_valtx_asistencia/app/ui/views/home/home_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BottomHome extends StatelessWidget {
  const BottomHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) => Container(
              height: kSizeBigLarge.h,
              margin: EdgeInsets.only(
                left: kMarginApp.w,
                right: kMarginApp.w,
                bottom: kMarginLargeApp.h,
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(kRadiusSmall),
                  bottomRight: Radius.circular(kRadiusSmall),
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
              child: Column(
                children: [
                  SizedBox(
                    height: kSizeBigLarge.h,
                    child: Obx(
                      () {
                        return controller.isLoadingMonth.value
                            ? Center(
                                child: SizedBox(
                                    height: kSizeNormalMediun.h,
                                    width: kSizeNormalMediun.w,
                                    child:
                                        CircularProgressIndicator(value: 1.h)))
                            : controller.responseUserAssistanceMonth.isEmpty
                                ? Center(
                                    child: Text(
                                        '${controller.statusMessageMonth}',
                                        style: AppTextStyle(context).medium14(
                                          color: AppColors.grayBlue,
                                        )),
                                  )
                                : ListView.separated(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.w),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: controller
                                        .responseUserAssistanceMonth.length,
                                    separatorBuilder: (context, index) {
                                      return SizedBox(width: kSizeBigMediun.w);
                                    },
                                    itemBuilder: (context, index) {
                                      final itemMonth = controller
                                          .responseUserAssistanceMonth[index];
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            textScaleFactor: 1,
                                            '${itemMonth.quantity}',
                                            style: AppTextStyle(context).bold14(
                                                color: AppColors.primary),
                                          ),
                                          Text(
                                            textScaleFactor: 1,
                                            itemMonth.description!,
                                            style: AppTextStyle(context)
                                                .medium12(
                                                    color: AppColors.grayBlue),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                      },
                    ),
                  ),
                ],
              ),
            ));
  }
}
