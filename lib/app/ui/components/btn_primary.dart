import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BtnPrimary extends StatelessWidget {
  const BtnPrimary({
    Key? key,
    required this.text,
    this.loading = false,
    this.isMaxHeight = false,
    this.isGreen = false,
    this.onTap,
    this.child,
  }) : super(key: key);
  final String text;
  final bool loading;
  final void Function()? onTap;
  final bool? isMaxHeight;
  final bool? isGreen;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isMaxHeight! ? 60.0.h : 40.0,
      decoration: BoxDecoration(
        gradient: isGreen!
            ? const LinearGradient(
                colors: [
                  AppColors.primary,
                  AppColors.primary,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              )
            : const LinearGradient(
                colors: [
                  AppColors.degradedStart, // Color de inicio del degradado
                  AppColors.red, // Color de final del degradado
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
        /* color: isGreen! ? AppColors.green : AppColors.blueDark, */
        borderRadius: BorderRadius.circular(kRadiusMedium.r),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          highlightColor: const Color.fromRGBO(0, 0, 0, 0.08),
          borderRadius: BorderRadius.circular(kRadiusMedium.r),
          onTap: onTap,
          child: Center(
            child: Text(text,
                style: AppTextStyle(context)
                      .bold18(color: AppColors.backgroundColor),),
          ),
          /* Container(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Center(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(text,
                      textAlign: TextAlign.center,
                      style: AppTextStyle(context)
                          .bold18(color: AppColors.backgroundColor)),
                  Center(child: child)
                ]),
              ),
            ]),
          ), */
        ),
      ),
    );
  }
}
