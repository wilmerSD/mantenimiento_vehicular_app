import 'package:app_valtx_asistencia/app/ui/views/schedule/schedule_controller.dart';
import 'package:app_valtx_asistencia/app/ui/views/schedule/widgets/schedule_indicator.dart';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScheduleUser extends StatelessWidget {
  const ScheduleUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScheduleController>(
        builder: (controller) => SizedBox(
              child: ListView(
                padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
                children: [
                  Obx(
                    () => ScheduleIndicator(
                      iconColor: AppColors.backgroundColor,
                      borderColor: AppColors.validationJustified,
                      backgroundColor: AppColors.grayBlue,
                      text:
                          controller.scheduleByUser.value.horaInicio.toString(),
                      title: 'Hora entrada',
                    ),
                  ),
                  Obx(
                    () => controller.scheduleByUser.value.idRefrigerio != null
                        ? ScheduleIndicator(
                            iconColor: AppColors.backgroundColor,
                            borderColor: AppColors.validationJustified,
                            backgroundColor: AppColors.grayBlue,
                            text:
                                '${controller.scheduleByUser.value.horaInicioRefrigerio ?? ""} - ${controller.scheduleByUser.value.horaFinRefrigerio ?? ""}',
                            title: 'Rango inicio de refrigerio',
                          )
                        : const SizedBox.shrink(),
                  ),
                  Obx(
                    () => controller
                                .scheduleByUser.value.tiempoRefrigerio !=
                            null
                        ? ScheduleIndicator(
                            iconColor: AppColors.backgroundColor,
                            borderColor: AppColors.validationJustified,
                            backgroundColor: AppColors.grayBlue,
                            text:
                                "${controller.scheduleByUser.value.tiempoRefrigerio.toString()} minutos",
                            title: 'Tiempo de refrigerio')
                        : const SizedBox.shrink(),
                  ),
                  Obx(
                    () => ScheduleIndicator(
                        iconColor: AppColors.backgroundColor,
                        borderColor: AppColors.validationJustified,
                        backgroundColor: AppColors.grayBlue,
                        text:
                            controller.scheduleByUser.value.horaFin.toString(),
                        title: 'Hora salida'),
                  ),
                  Obx(
                    () => ScheduleIndicator(
                        iconColor: AppColors.backgroundColor,
                        borderColor: AppColors.red,
                        backgroundColor: AppColors.grayBlue,
                        text:
                            controller.scheduleByUser.value.descanso.toString(),
                        title: 'Descanso'),
                  ),
                  Obx(
                    () => controller.scheduleByUser.value.diaExcepcion != null
                        ? Container(
                            margin: const EdgeInsets.all(10),
                            /* padding: const EdgeInsets.only(left: 15), */
                            decoration: const BoxDecoration(
                              color: AppColors.orange,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            height: kSizeAmple,
                            child: Container(
                              margin: const EdgeInsets.only(top: 10.0),
                              padding: const EdgeInsets.all(
                                kPaddingAppNormalApp,
                              ),
                              decoration: const BoxDecoration(
                                color: AppColors.backgroundColor,
                                borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(10)),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Día con horario\ndiferente:',
                                        style: AppTextStyle(context).bold16(
                                          color: AppColors.primary,
                                        ),
                                      ),
                                      Text(
                                        'Hora entrada:',
                                        style: AppTextStyle(context).bold16(
                                          color: AppColors.primary,
                                        ),
                                      ),
                                      Text(
                                        'Hora salida:',
                                        style: AppTextStyle(context).bold16(
                                          color: AppColors.primary,
                                        ),
                                      ),
                                    ],
                                  ),
                                  /* const SizedBox(
                                    width: 20,
                                  ), */
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        controller.scheduleByUser.value
                                                .diaExcepcion ??
                                            '-',
                                        style: AppTextStyle(context).semi16(
                                          color: AppColors.primary,
                                        ),
                                      ),
                                      const Text(''),
                                      Text(
                                        controller.scheduleByUser.value
                                                .hraInicioExcepcion ??
                                            '-',
                                        style: AppTextStyle(context).semi16(
                                          color: AppColors.primary,
                                        ),
                                      ),
                                      Text(
                                        controller.scheduleByUser.value
                                                .horaFinExcepcion ??
                                            '-',
                                        style: AppTextStyle(context).semi16(
                                          color: AppColors.primary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
            ));
  }
}
