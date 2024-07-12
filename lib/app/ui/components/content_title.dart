import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class ContentTitle extends StatelessWidget {
  const ContentTitle({
    Key? key,
    required this.title,
    this.margin,
    this.showTrailing = false,
    this.trailing,
    this.trailingOnTap,
    this.colorTitle = AppColors.black,
  }) : super(key: key);

  final String title;
  final EdgeInsetsGeometry? margin;
  final bool showTrailing;
  final Widget? trailing;
  final VoidCallback? trailingOnTap;
  final Color colorTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      margin: margin,
      padding: const EdgeInsets.symmetric(horizontal: kMarginMediunApp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyle(context).bold16(
              color: colorTitle,
            ),
          ),
          showTrailing ? trailing ?? const SizedBox() : const SizedBox(),
        ],
      ),
    );
  }
}
