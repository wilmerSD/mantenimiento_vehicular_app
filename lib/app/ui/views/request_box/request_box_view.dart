import 'package:app_valtx_asistencia/app/models/response/others/response_select_model.dart';
import 'package:app_valtx_asistencia/app/ui/components/dropdown_select.dart';
import 'package:app_valtx_asistencia/app/ui/components/option_select.dart';
import 'package:app_valtx_asistencia/app/ui/views/request_box/widgets/filter_type_request.dart';
import 'package:app_valtx_asistencia/app/ui/views/request_box/widgets/list_justification.dart';
import 'package:app_valtx_asistencia/app/ui/views/request_box/widgets/list_permission.dart';
import 'package:app_valtx_asistencia/app/ui/views/request_box/widgets/list_vacations.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'request_box_controller.dart';

class RequestBoxView extends StatelessWidget {
  const RequestBoxView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestBoxController>(
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: kSizeNormalLarge.h,
          elevation: 0.18,
          iconTheme: const IconThemeData(color: AppColors.primary),
          backgroundColor: AppColors.backgroundColor,
          title: Text(
            'Bandeja de Solicitudes',
            style: AppTextStyle(context).extra20(
              color: AppColors.primary,
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(kMarginNormalApp),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(215, 214, 214, 100),
                /* color: AppColors.backgroundColor, */
                borderRadius: BorderRadius.circular(kRadiusSmall.h),
              ),
              child: Obx(
                () => Select(
                  value: controller.stateListToCreateTEC.firstWhere((element) =>
                      element.value == controller.currentRequest.value),
                  items: controller.stateListToCreateTEC.map(
                    (element) {
                      return DropdownMenuItem(
                        value: element,
                        child: OptionSelect(nameOption: element.text),
                      );
                    },
                  ).toList(),
                  onChanged: (newValue) {
                    controller.currentRequest.value =
                        (newValue as DatumSelect2Combo).value!;
                    controller.currentStateRequest.value = -1;
                  },
                ),
              ),
            ),
            Obx(() {
              if (controller.currentRequest.value != -1) {
                return const FilterTypeRequest();
              }
              return const SizedBox();
            }),
            Obx(
              () {
                /* controller.getAllMyRequest(); */

                if (controller.currentRequest.value != -1 &&
                    controller.currentStateRequest.value == -1) {
                  controller.getAllMyRequest();
                }

                if (controller.currentRequest.value != -1 &&
                    controller.currentStateRequest.value != -1) {
                  controller.getAllMyRequest(
                      stateInProgress: controller.currentStateRequest.value,
                      stateApprovedByLeader:
                          controller.currentStateRequest.value,
                      stateRejectedByLeader:
                          controller.currentStateRequest.value);
                }
                return controller.currentRequest.value == 1
                    ? const Expanded(child: ListJustifications())
                    : controller.currentRequest.value == 2
                        ? const Expanded(child: ListPermissions())
                        : controller.currentRequest.value == 3
                            ? const Expanded(child: ListVacations())
                            : const SizedBox();
              },
            ),
          ],
        ),
        /* FormPermission()), */
      ),
    );
  }
}
