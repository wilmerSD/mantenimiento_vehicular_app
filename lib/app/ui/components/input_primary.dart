import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputPrimary extends StatelessWidget {
  const InputPrimary({
    Key? key,
    required this.label,
    this.privateText = false,
    this.suffix,
    this.onChanged,
    this.onEditingComplete,
    this.initialValue = "",
    this.enabledfield = false,
    this.maxlines = 1,
    this.textEditingController,
    this.textInputType = TextInputType.text,
    this.autofocus = false,
    this.inputFormats,
    this.validator,
    this.isActive = true,
    this.maxLength,
    this.suffixIcon,
    this.autoValidate,
    this.onTap,
    this.colorLabel,
    this.hintText,
    this.readOnly = false,
  }) : super(key: key);
  final String label;
  final bool privateText;
  final Widget? suffix;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final String? initialValue;
  final String? hintText;
  final bool? enabledfield;
  final int? maxlines;
  final int? maxLength;
  final TextEditingController? textEditingController;
  final TextInputType? textInputType;
  final bool? autofocus;
  final List<TextInputFormatter>? inputFormats;
  final String? Function(String?)? validator;
  final bool isActive;
  final AutovalidateMode? autoValidate;
  final Widget? suffixIcon;
  final Function()? onTap;
  final Color? colorLabel;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      autovalidateMode: autoValidate ?? AutovalidateMode.onUserInteraction,
      inputFormatters: inputFormats,
      autofocus: autofocus ?? false,
      keyboardType: textInputType,
      maxLines: maxlines,
      maxLength: maxLength,
      controller: textEditingController,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      obscureText: privateText,
      enabled: isActive,
      readOnly: readOnly,
      style: TextStyle(
          fontSize: 14.0,
          color: isActive ? AppColors.blueDark : AppColors.grayBlue,
          fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        border: InputBorder.none,
        suffixIcon: suffixIcon,
        isDense: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 0.0, vertical: 12.0),
        suffix: suffix,
        labelText: label,
        counterText: "",
        hintText: hintText ?? "",
        labelStyle: TextStyle(
            fontSize: 14.0,
            // fontWeight: FontWeight.w400,
            color: colorLabel ?? AppColors.black),
      ),
      onTap: onTap,
    );
  }
}
