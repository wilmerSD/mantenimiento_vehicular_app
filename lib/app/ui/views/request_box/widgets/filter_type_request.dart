import 'package:app_valtx_asistencia/app/models/response/others/response_select_model.dart';
import 'package:app_valtx_asistencia/app/ui/components/dropdown_select.dart';
import 'package:app_valtx_asistencia/app/ui/components/option_select.dart';
import 'package:app_valtx_asistencia/app/ui/views/request_box/request_box_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FilterTypeRequest extends StatelessWidget {
  const FilterTypeRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestBoxController>(
      builder: (controller) => Column(
        children: [
          Container(
            margin: const EdgeInsets.all(kMarginNormalApp),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(215, 214, 214, 100),
              /* color: AppColors.backgroundColor, */
              borderRadius: BorderRadius.circular(kRadiusSmall.h),
            ),
            child: Obx(
              () {
                return Select(
                  value: controller.listStatusRequest.firstWhere((element) =>
                      element.value == controller.currentStateRequest.value),
                  items: controller.listStatusRequest.map(
                    (element) {
                      return DropdownMenuItem(
                        value: element,
                        child: OptionSelect(nameOption: element.text),
                      );
                    },
                  ).toList(),
                  onChanged: (newValue) {
                    controller.currentStateRequest.value =
                        (newValue as DatumSelect2Combo).value!;
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
