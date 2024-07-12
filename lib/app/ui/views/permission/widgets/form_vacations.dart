import 'package:app_valtx_asistencia/app/ui/components/alert_dialog_component.dart';
import 'package:app_valtx_asistencia/app/ui/components/btn_primary_ink.dart';
import 'package:app_valtx_asistencia/app/ui/components/icon_wrapper.dart';
import 'package:app_valtx_asistencia/app/ui/components/input_primary.dart';
import 'package:app_valtx_asistencia/app/ui/views/permission/permission_controller.dart';
import 'package:app_valtx_asistencia/app/ui/views/permission/widgets/vacation_indicators.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FormVacations extends StatelessWidget {
  const FormVacations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PermissionController>(builder: (controller) {
      final keyFormSearch = GlobalKey<FormState>();

      /*📌 Widget para ingresar fecha inicio */
      Widget inputDateFirst = InputPrimary(
        hintText: "dd/mm/aaaa",
        label: "Fecha Inicio:",
        maxLength: 10,
        textEditingController: controller.firstDate,
        onChanged: (value) {
          controller.firstDate.value;
        },
        inputFormats: [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9\/]')),
        ],
        validator: (date) {
          if (Helpers.compareDatesDMY(
                  controller.firstDate.text, controller.endDate.text) >
              0) {
            return kmessageErrorCompareDateStart;
          }
          if (Helpers.compareDatesDMY(
                  controller.firstDate.text, controller.dateToday) <
              0) {
            return kmessageErrorCompareDateTodayStart;
          } else {
            return Helpers.noRequiredDateTimeDMY(date, date ?? "");
          }
        },
        suffixIcon: IconWrapper(
            onTap: () async {
              DateTime? pickdateInicio = await showDatePicker(
                context: context,
                locale: const Locale("es", "ES"),
                initialDate: DateTime.now().add(const Duration(days: 1)),
                firstDate: DateTime.now().add(const Duration(days: 1)),
                lastDate: DateTime(2100),
                cancelText: textCancelText,
                confirmText: textconfirmText,
              );
              if (pickdateInicio != null) {
                controller.firstDate.text =
                    Helpers.dateToStringTimeDMY(pickdateInicio);
              }
            },
            child: const Icon(Iconsax.calendar)),
      );

      /*📌 Widget para ingresar fecha fin */
      Widget inputDateEnd = InputPrimary(
        hintText: "dd/mm/aaaa",
        label: "Fecha Fin:",
        maxLength: 10,
        textEditingController: controller.endDate,
        onChanged: (value) {
          controller.endDate.value;
        },
        inputFormats: [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9\/]')),
        ],
        validator: (date) {
          if (Helpers.compareDatesDMY(
                  controller.endDate.text, controller.firstDate.text) <
              0) {
            return kmessageErrorCompareDateEnd;
          }
          if (Helpers.compareDatesDMY(
                  controller.endDate.text, controller.dateToday) <
              0) {
            return kmessageErrorCompareDateTodayEnd;
          } else {
            return Helpers.noRequiredDateTimeDMY(date, date ?? "");
          }
        },
        suffixIcon: IconWrapper(
            onTap: () async {
              DateTime? pickdateInicio = await showDatePicker(
                context: context,
                locale: const Locale("es", "ES"),
                initialDate: DateTime.now().add(const Duration(days: 1)),
                firstDate: DateTime.now().add(const Duration(days: 1)),
                lastDate: DateTime(2100),
                cancelText: textCancelText,
                confirmText: textconfirmText,
              );
              if (pickdateInicio != null) {
                controller.endDate.text =
                    Helpers.dateToStringTimeDMY(pickdateInicio);
              }
            },
            child: const Icon(Iconsax.calendar)),
      );

      /*📌 Widget para ingresar motivo */
      Widget reason = InputPrimary(
        maxlines: null,
        textEditingController: controller.reasonVacations,
        label: "Motivo:",
        onChanged: (value) => controller.reasonVacations.value,
        /* isActive: false, */
      );

      /* 📌 Boton para buscar */
      Widget btnSend = Obx(
        () => BtnPrimaryInk(
          text: controller.isLoading.value ? textSending : textSend,
          onTap: () {
            if (keyFormSearch.currentState!.validate()) {
              controller.validateVacations(context);
            }
          },
        ),
      );

      /*📌 Widget para marcar si es adelanto o no */
      Widget isPreviewVacation = Row(children: [
        Obx(
          () => Checkbox(
            value: controller.isPreviewVacation.value,
            onChanged: (bool? newValue) {
              if (newValue != null) {
                controller.toggleCheckIsPreview();
              }
            },
          ),
        ),
        const Text(
          'Adelanto vacacional',
          style: TextStyle(
              fontSize: 14.0,
              // fontWeight: FontWeight.w400,
              color: AppColors.grayMiddle),
        )
      ]);

      return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Form(
          key: keyFormSearch,
          child: ListView(
            padding: const EdgeInsets.all(kMarginNormalApp),
            /* mainAxisAlignment: MainAxisAlignment.spaceAround, */
            children: [
              const VacationIndicators(),
              SizedBox(
                height: kSizeExtraMediun.h,
              ),
              Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: kPaddingAppNormalApp.h),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(246, 246, 246, 100),
                    borderRadius: BorderRadius.circular(kRadiusSmall.h),
                  ),
                  child: inputDateFirst),
              SizedBox(
                height: kSizeNormalMediun.h,
              ),
              Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: kPaddingAppNormalApp.h),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(246, 246, 246, 100),
                    borderRadius: BorderRadius.circular(kRadiusSmall.h),
                  ),
                  child: inputDateEnd),
              SizedBox(
                height: kSizeNormalMediun.h,
              ),
              isPreviewVacation,
              SizedBox(
                height: kSizeNormalMediun.h,
              ),
              btnSend
            ],
          ),
        ),
      );
    });
  }
}
