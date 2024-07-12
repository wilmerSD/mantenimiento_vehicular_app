import 'package:app_valtx_asistencia/app/ui/components/alert_dialog_component.dart';
import 'package:app_valtx_asistencia/app/ui/views/home/home_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlertRegisterGood extends StatelessWidget {
  const AlertRegisterGood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) => Obx(() {
              final item = controller.responseUserAssistance;
              String? registradoComo = item.value.registradoComo;
              String? detail = item.value.detalle;
              /* print("${item.value.idMostrarForm} aqui probando porque sale este form"); */
              return item.value.idMostrarForm != 0
                  ? GestureDetector(
                      onTap: () => FocusScope.of(context).unfocus(),
                      child: ListView(
                        children: [
                          AlertDialogComponent(
                              isDismissibleDialog: false,
                              title: 'Justificación de tardanza',
                              headerTitle: '¿Desea enviar su justificación?',
                              content:
                                  controller.statusMessageUserAssistance.value,
                              onTapButton: () async {
                                if (controller.reasonJustification.isNotEmpty) {
                                  await controller.sendJustification(
                                      controller.selectedValue,
                                      controller.reasonJustification);
                                  Get.back();
                                  controller.statusAssistance.value = false;
                                  if (controller.statusJustification.value) {
                                    Get.dialog(AlertDialogComponent(
                                      title: "Información sobre el registro",
                                      headerTitle: "Información",
                                      onTapButton: () async {
                                        await controller
                                            .cleanReasonJustification();
                                        Get.back();
                                      },
                                      widgetContent: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                              controller
                                                  .statusMessageUserJustification
                                                  .value,
                                              textScaleFactor: 1,
                                              textAlign: TextAlign.center,
                                              style:
                                                  AppTextStyle(context).bold14(
                                                color: AppColors.primary,
                                              )),
                                          SizedBox(
                                            height: kSizeSmallLittle.h,
                                          ),
                                        ],
                                      ),
                                      isOnlyPrimary: true,
                                      textPrimaryButton: "OK",
                                    ));
                                  } else {
                                    Helpers.showSnackBar(
                                      Get.context!,
                                      title: "Validar",
                                      message:
                                          "Ups! Ocurrió un error al enviar la justificación",
                                    );
                                  }
                                } else {
                                  controller.messageHintText.value =
                                      "Si deseas enviar una justicación\ndebes completar este campo.";
                                }
                              },
                              onTapButtonSecondary: () async {
                                await controller.cleanReasonJustification();
                                Get.back();
                                controller.statusAssistance.value = false;
                              },
                              widgetContent: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    registradoComo ?? '',
                                    textScaleFactor: 1,
                                    textAlign: TextAlign.center,
                                    style: AppTextStyle(context).medium14(
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  SizedBox(height: kSize.h),
                                  Text(
                                    'Fecha',
                                    textScaleFactor: 1,
                                    textAlign: TextAlign.center,
                                    style: AppTextStyle(context).bold16(
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  Text(
                                    Helpers.changeDateTodMy(controller.formattedDate!),
                                    textScaleFactor: 1,
                                    textAlign: TextAlign.center,
                                    style: AppTextStyle(context).medium14(
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  SizedBox(height: kSize.h),
                                  Text('Tipo de marcación',
                                      textScaleFactor: 1,
                                      textAlign: TextAlign.center,
                                      style: AppTextStyle(context).bold16(
                                        color: AppColors.primary,
                                      )),
                                  Text(
                                    controller.descriptionTypeMark,
                                    textScaleFactor: 1,
                                    textAlign: TextAlign.center,
                                    style: AppTextStyle(context).medium14(
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  SizedBox(height: kSize.h),
                                  Text('Motivo',
                                      textScaleFactor: 1,
                                      textAlign: TextAlign.center,
                                      style: AppTextStyle(context).bold16(
                                        color: AppColors.primary,
                                      )),
                                  Obx(
                                    () => TextField(
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(150)
                                      ],
                                      maxLines: null,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      onChanged: (text) {
                                        controller.reasonJustification = text;
                                        controller.reasonJustificationControl
                                            .value = text;
                                      },
                                      decoration: controller
                                              .reasonJustificationControl
                                              .isEmpty
                                          ? InputDecoration(
                                              hintText: controller
                                                  .messageHintText.value,
                                            )
                                          : const InputDecoration(
                                              hintText: "",
                                            ),
                                      style: AppTextStyle(context).medium14(
                                        color: AppColors.primary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              isOnlyPrimary: false,
                              textPrimaryButton: "Enviar",
                              textSecondaryButton: "Cancelar"),
                        ],
                      ),
                    )
                  : AlertDialogComponent(
                      title: "Información sobre el registro",
                      headerTitle: "Información",
                      content: controller.statusMessageUserAssistance.value,
                      onTapButton: () {
                        Get.back();
                        controller.statusAssistance.value = false;
                      },
                      widgetContent: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(registradoComo ?? '',
                              textScaleFactor: 1,
                              textAlign: TextAlign.center,
                              style: AppTextStyle(context).bold16(
                                color: AppColors.primary,
                              )),
                          SizedBox(
                            height: kSizeSmallLittle.h,
                          ),
                          Text(
                            detail ?? '',
                            textScaleFactor: 1,
                            textAlign: TextAlign.center,
                            style: AppTextStyle(context).medium14(
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                      isOnlyPrimary: true,
                      textPrimaryButton: "OK",
                    );
            }));
  }
}
