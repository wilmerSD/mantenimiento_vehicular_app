// ignore_for_file: dead_code

import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  AppTextStyle(this.context);
  final BuildContext context;

  TextStyle titleAppBar({
    Color color = AppColors.grayLight,
  }) =>
      Theme.of(context).textTheme.titleLarge!.copyWith(
          color: color, fontWeight: FontWeight.bold, fontFamily: 'Montserrat');

  TextStyle bold26({Color color = AppColors.backgroundColor}) =>
      Theme.of(context).textTheme.titleLarge!.copyWith(
          color: color,
          fontWeight: FontWeight.w700,
          fontSize: 26.sp,
          fontFamily: 'Montserrat');
  TextStyle bold24({Color color = AppColors.backgroundColor}) =>
      Theme.of(context).textTheme.titleLarge!.copyWith(
          color: color,
          fontWeight: FontWeight.w700,
          fontSize: 24.sp,
          fontFamily: 'Montserrat');

  TextStyle bold16({Color? color = AppColors.grayDark}) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: color,
          fontWeight: FontWeight.w700,
          fontSize: 16.sp,
          fontFamily: 'Montserrat');
  //-----------------------------

  TextStyle normal12({
    Color color = AppColors.grayLight,
  }) =>
      Theme.of(context)
          .textTheme
          .bodySmall!
          .copyWith(color: color, fontSize: 12.0.sp, fontFamily: 'Montserrat');

  TextStyle semi12({
    Color color = AppColors.grayLight,
  }) =>
      Theme.of(context).textTheme.bodySmall!.copyWith(
          color: color,
          fontWeight: FontWeight.w500,
          fontSize: 12.0.sp,
          fontFamily: 'Montserrat');

  TextStyle semi16({Color color = AppColors.grayLight}) =>
      Theme.of(context).textTheme.titleMedium!.copyWith(
          color: color,
          fontWeight: FontWeight.w500,
          fontSize: 16.0.sp,
          fontFamily: 'Montserrat');

  TextStyle bold14({Color? color = AppColors.grayDark}) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
          fontSize: 14.sp,
          fontFamily: 'Montserrat');

  TextStyle bold18({
    Color? color = Colors.black,
  }) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: color,
          fontWeight: FontWeight.w700,
          fontSize: 18.sp,
          fontFamily: 'Montserrat');

  TextStyle semi14({
    Color color = AppColors.grayLight,
  }) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: color,
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
          fontFamily: 'Montserrat');

  TextStyle medium14({
    Color color = AppColors.grayLight,
  }) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: color,
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
          fontFamily: 'Montserrat');

  TextStyle medium12({
    Color color = AppColors.grayLight,
  }) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: color,
          fontWeight: FontWeight.w400,
          fontSize: 12.sp,
          fontFamily: 'Montserrat');

  TextStyle extra20({Color? color = AppColors.backgroundColor}) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 20.0.sp,
          fontFamily: 'Montserrat');

  TextStyle extra22({Color? color = AppColors.backgroundColor}) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: color,
            fontWeight: FontWeight.w900,
            fontSize: 22.0.sp,
          );

  TextStyle extra14({Color? color = AppColors.backgroundColor}) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: color,
            fontWeight: FontWeight.w300,
            fontSize: 14.sp,
          );

  TextStyle extra16({Color? color = AppColors.backgroundColor}) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 16.sp,
          fontFamily: 'Montserrat');

  TextStyle extra40({
    Color? color = AppColors.backgroundColor,
  }) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 40.sp,
            fontFamily: 'Montserrat',
          );
}
