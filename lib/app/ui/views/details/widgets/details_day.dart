import 'package:app_valtx_asistencia/app/ui/views/details/details_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

final helpers = Helpers();

class DetailsDay extends StatelessWidget {
  const DetailsDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsController>(
        builder: (controller) => Container(
              margin: EdgeInsets.symmetric(horizontal: kMarginLargeApp.w),
              height: kSizeSmallAmple.h,
              child: Obx(() {
                return controller.isVisibleDay.value
                    ? Center(
                        child: SizedBox(
                            height: kSizeMediun.h,
                            width: kSizeMediun.w,
                            child: CircularProgressIndicator(value: 1.h)))
                    : controller.responseDataDia.isEmpty
                        ? Center(
                            child: Text('${controller.statusMessageDay}',
                                style: AppTextStyle(context).medium14(
                                  color: AppColors.grayBlue,
                                )),
                          )
                        : ListView.separated(
                            padding:
                                EdgeInsets.only(bottom: kPaddingAppBigApp.h),
                            itemCount: controller.responseDataDia.length,
                            separatorBuilder: (context, index) {
                              return SizedBox(height: kSize.h);
                            },
                            itemBuilder: (context, index) {
                              final itemDay = controller.responseDataDia[index];
                              Color circleColordia =
                                  helpers.getCircleColor(itemDay.idValidation!);
                              return Row(
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 10.h,
                                        backgroundColor: circleColordia,
                                      ),
                                      SizedBox(width: kSize.w),
                                      Text(
                                        textScaleFactor: 1,
                                        itemDay.time ?? '',
                                        style: AppTextStyle(context).extra14(
                                          color: AppColors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: kSizeBigLittle.w),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        textScaleFactor: 1,
                                        itemDay.typesMarking!,
                                        style: AppTextStyle(context).bold14(
                                          color: AppColors.primary,
                                        ),
                                      ),
                                      SizedBox(
                                        width: kSizeExtra.w,
                                        child: Text(
                                          textScaleFactor: 1,
                                          overflow: TextOverflow.ellipsis,
                                          itemDay.reason ?? "Sin observaciones",
                                          style: AppTextStyle(context).medium14(
                                            color: AppColors.grey,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              );
                            },
                          );
              }),
            ));
  }
}
