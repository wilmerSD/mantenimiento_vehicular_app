
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BtnIcon extends StatelessWidget {
  const BtnIcon({
    Key? key,
    required this.onTap,
    required this.icon,
    this.color = AppColors.black,
  }) : super(key: key);

  final VoidCallback onTap;
  final IconData icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 18.0,
        backgroundColor: Colors.transparent,
        child: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }
}
