import 'package:app_valtx_asistencia/app/models/response/others/response_select_model.dart';
import 'package:app_valtx_asistencia/app/ui/components/dropdown_select.dart';
import 'package:app_valtx_asistencia/app/ui/components/option_select.dart';
import 'package:app_valtx_asistencia/app/ui/views/permission/permission_controller.dart';
import 'package:app_valtx_asistencia/app/ui/views/permission/widgets/form_permission.dart';
import 'package:app_valtx_asistencia/app/ui/views/permission/widgets/form_vacations.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PermissionView extends StatelessWidget {
  const PermissionView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PermissionController>(
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: kSizeNormalLarge.h,
          elevation: 0.18,
          iconTheme: const IconThemeData(color: AppColors.primary),
          backgroundColor: AppColors.backgroundColor,
          title: Text(
            'Solicitudes',
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
                    value: controller.stateListToCreateTEC.firstWhere(
                        (element) =>
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
                    },
                  ),
                ) /* Select(
                hint: "Elegir solicitud",
                items: listaDeOpciones.map((e) {
                  return DropdownMenuItem<String>(
                    child: Text(e),
                    value: e,
                  );
                }).toList(),
                /* value: listaDeOpciones, */
                onChanged: (newValue) {},
              ), */
                /* FormVacations() */),
            Obx(() {
              return controller.currentRequest.value == 2
                  ? const Expanded(child: FormPermission())
                  : controller.currentRequest.value == 3
                      ? const Expanded(child: FormVacations())
                      : const SizedBox();
            }),
          ],
        ),
        /* FormPermission()), */
      ),
    );
  }
}

/* List<String> listaDeOpciones = [
  "Permisos",
  "Vacaciones",
]; */
