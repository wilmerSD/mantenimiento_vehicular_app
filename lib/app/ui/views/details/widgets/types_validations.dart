import 'package:app_valtx_asistencia/app/ui/views/details/details_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

final helpers = Helpers();

class TypesValidations extends StatelessWidget {
  const TypesValidations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsController>(
      builder: (controller) => Container(
        margin: EdgeInsets.symmetric(horizontal: kMarginLargeApp.w),
        height: kSizeBigLarge.h,
        child: Obx(
          () => controller.isLoadingTypesValidation.value
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.responseTypesValidations.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(width: kSizeBig.w);
                  },
                  itemBuilder: (context, index) {
                    final item = controller.responseTypesValidations[index];
                    Color circleColor =
                        helpers.getCircleColor(item.idValidation);
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: kRadiusSmall.h,
                          backgroundColor: circleColor,
                        ),
                        SizedBox(height: kSizeSmallLittle.h),
                        Text(
                          textScaleFactor: 1,
                          item.description,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyle(context).medium12(
                            color: AppColors.grayBlue,
                          ),
                        ),
                      ],
                    );
                  },
                ),
        ),
      ),
    );
  }
}
