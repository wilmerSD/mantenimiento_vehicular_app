import 'package:app_valtx_asistencia/app/ui/views/request_box/request_box_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ListJustifications extends StatelessWidget {
  const ListJustifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestBoxController>(
      builder: (controller) => Obx(() {
        /*  controller.getAllMyRequest(); */
        return controller.isLoadingJustifications.value
            ? Center(
                child: SizedBox(
                    height: kSizeMediun.h,
                    width: kSizeMediun.w,
                    child: CircularProgressIndicator(value: 1.h)))
            : Column(
                children: [
                  /* FilterTypeRequest(), */
                  Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.only(
                          left: kMarginNormalApp.w,
                          right: kMarginNormalApp.w,
                          bottom: kMarginNormalApp.h),
                      scrollDirection: Axis.vertical,
                      itemCount: controller.getAllMyRequestResponse.length,
                      separatorBuilder: (context, index) {
                        return SizedBox(height: kSizeBigLittle.h);
                      },
                      itemBuilder: (context, index) {
                        final itemAllMyRequest =
                            controller.getAllMyRequestResponse[index];
                        return Container(
                          padding: EdgeInsets.all(kMarginNormalApp.w),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(215, 214, 214, 100),
                            borderRadius: BorderRadius.circular(kRadiusSmall.h),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    textScaleFactor: 1,
                                    itemAllMyRequest.fecha != null
                                        ? DateTime.parse(itemAllMyRequest.fecha!
                                                .toIso8601String())
                                            .toString()
                                            .split(" ")[0]
                                        : '',
                                    style: AppTextStyle(context).bold16(
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  Text(
                                    textScaleFactor: 1,
                                    itemAllMyRequest
                                            .descripcionEstadoSolicitud ??
                                        '',
                                    style: AppTextStyle(context).medium12(
                                      color: AppColors.grayBlue,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    textScaleFactor: 1,
                                    'Tipo de marcación:',
                                    style: AppTextStyle(context).bold16(
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  Text(
                                    textScaleFactor: 1,
                                    itemAllMyRequest.descripcionTipoMarcacion ??
                                        '',
                                    style: AppTextStyle(context).medium12(
                                      color: AppColors.grayBlue,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    textScaleFactor: 1,
                                    'Motivo:',
                                    style: AppTextStyle(context).bold16(
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  Text(
                                    textScaleFactor: 1,
                                    itemAllMyRequest.motivo ?? '',
                                    style: AppTextStyle(context).medium12(
                                      color: AppColors.grayBlue,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              );
      }),
    );
  }
}
