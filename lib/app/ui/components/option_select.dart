import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class OptionSelect extends StatelessWidget {
  const OptionSelect({Key? key, this.nameOption}) : super(key: key);
  final String? nameOption;
  @override
  Widget build(BuildContext context) {
    return Text(nameOption ?? "",
        style: const TextStyle(
          fontSize: 14,
          color: AppColors.grayDark,
        ));
  }
}
