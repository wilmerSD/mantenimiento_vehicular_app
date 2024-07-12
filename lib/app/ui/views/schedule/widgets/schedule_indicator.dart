import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ScheduleIndicator extends StatelessWidget {
  final Color iconColor;
  final Color borderColor;
  final Color backgroundColor;
  final String text;
  final String title;

  const ScheduleIndicator(
      {Key? key,
      required this.iconColor,
      required this.borderColor,
      required this.backgroundColor,
      required this.text,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Container(
                width: 2,
                height: 40,
                color: backgroundColor,
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: borderColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(
                  Iconsax.clock,
                  color: iconColor,
                ),
              ),
              Container(
                width: 2,
                height: 30,
                color: backgroundColor,
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Container(
            margin: const EdgeInsets.all(10),
            /* padding: const EdgeInsets.only(left: 15), */
            decoration: const BoxDecoration(
              color: AppColors.blueDark,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            height: 80,
            child: Container(
              margin: const EdgeInsets.only(top: 10.0),
              padding: const EdgeInsets.all(
                kPaddingAppNormalApp,
              ),
              decoration: const BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(10)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    textScaleFactor: 1,
                    title,
                    style: AppTextStyle(context).bold16(
                      color: AppColors.primary,
                    ),
                  ),
                  Text(
                    textScaleFactor: 1,
                    text,
                    style: AppTextStyle(context).semi16(
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
