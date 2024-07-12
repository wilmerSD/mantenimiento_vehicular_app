import 'package:app_valtx_asistencia/app/ui/components/btn_primary_ink.dart';
import 'package:app_valtx_asistencia/app/ui/components/icon_wrapper.dart';
import 'package:app_valtx_asistencia/app/ui/components/input_primary.dart';
import 'package:app_valtx_asistencia/app/ui/views/permission/permission_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FormPermission extends StatelessWidget {
  const FormPermission({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PermissionController>(builder: (controller) {
      final keyFormSearch = GlobalKey<FormState>();

      /*📌 Widget para ingresar fecha de permiso */
      Widget dateToPermission = InputPrimary(
          hintText: "dd/mm/aaaa",
          label: "Fecha para permiso",
          textEditingController: controller.datePermission,
          onChanged: (value) {
            controller.datePermission.value;
          },
          maxLength: 10,
          inputFormats: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9\/]')),
          ],
          validator: (date) {
            if (Helpers.compareDatesDMY(
                    controller.datePermission.text, controller.dateToday) <
                0) {
              return kmessageErrorDate;
            } else {
              return Helpers.noRequiredDateTimeDMY(date, date ?? "");
            }
          },
          suffixIcon: IconWrapper(
              onTap: () async {
                DateTime? pickdateInicio = await showDatePicker(
                  context: context,
                  locale: const Locale("es", "ES"),
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                  cancelText: textCancelText,
                  confirmText: textconfirmText,
                );
                if (pickdateInicio != null) {
                  controller.datePermission.text =
                      Helpers.dateToStringTimeDMY(pickdateInicio);
                }
              },
              child: const Icon(Iconsax.calendar, color: AppColors.blueDark)));

      /*📌 Widget para ingresar motivo*/
      Widget reason = InputPrimary(
        maxlines: null,
        inputFormats: [LengthLimitingTextInputFormatter(reasonMax)],
        textEditingController: controller.reason,
        label: "Motivo:",
        onChanged: (value) => controller.reason.value,
        /* isActive: false, */
      );

      /*📌 Para enviar la solicitud */
      Widget btnSend = Obx(
        () => BtnPrimaryInk(
          text: controller.isLoading.value ? textSending : textSend,
          onTap: () {
            if (keyFormSearch.currentState!.validate()) {
              controller.validateForm(context);
            }
          },
        ),
      );

      return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Form(
          key: keyFormSearch,
          child: ListView(
            padding: const EdgeInsets.all(kMarginNormalApp),
            /* mainAxisAlignment: MainAxisAlignment.spaceAround, */
            children: [
              Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: kPaddingAppNormalApp.h),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(246, 246, 246, 100),
                    borderRadius: BorderRadius.circular(kRadiusSmall.h),
                  ),
                  child: dateToPermission),
              SizedBox(
                height: kSizeNormalMediun.h,
              ),
              Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: kPaddingAppNormalApp.h),
                  height: 300.h,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(246, 246, 246, 100),
                    borderRadius: BorderRadius.circular(kRadiusSmall.h),
                  ),
                  child: reason),
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
