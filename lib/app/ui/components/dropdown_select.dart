import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Select extends StatelessWidget {
  const Select(
      {Key? key,
      this.label,
      this.hint,
      this.items,
      this.onChanged,
      this.validator,
      this.enabledBorderColor,
      this.focusedBorderColor,
      this.onTap,
      this.isHint = false,
      this.value,
      this.isActive = true,
      this.autoValidate,
      this.height,
      this.selectedItemBuilder,
      this.hintText,
      this.isPadLeft})
      : super(key: key);
  final String? label;
  final String? hint;
  final void Function(Object?)? onChanged;
  final List<DropdownMenuItem<Object>>? items;
  final String? Function(Object?)? validator;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Function()? onTap;
  final bool isHint;
  final Object? value;
  final bool isActive;
  final double? height;
  final String? hintText;
  final double? isPadLeft;
  final AutovalidateMode? autoValidate;
  final List<Widget> Function(BuildContext)? selectedItemBuilder;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField2(
        value: value,
        autofocus: false,
        isExpanded: true,
        selectedItemBuilder: selectedItemBuilder,
        hint: Text(hint ?? "Seleccione",
            style: TextStyle(
                fontSize: 14,
                color: isActive ? AppColors.grayBlue : AppColors.blueDark)),
        decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(kRadiusSmall.h),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 14.0),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            label: Text(label ?? "",
                style:
                    const TextStyle(fontSize: 14, color: AppColors.grayBlue)),
            enabled: true,
            filled: false,
            isDense: true),
        items: items,
        validator: validator,
        autovalidateMode: autoValidate ?? AutovalidateMode.onUserInteraction,
        onChanged: onChanged,
        dropdownStyleData: DropdownStyleData(
          maxHeight: height ?? 200.0,
          useSafeArea: false,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
          ),
          offset: const Offset(0, 20),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: MaterialStateProperty.all<double>(6),
            thumbVisibility: MaterialStateProperty.all<bool>(true),
          ),
        ),
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.symmetric(horizontal: 0),
          width: double.infinity,
          /* decoration: BoxDecoration(
            color: Color.fromRGBO(215, 214, 214, 100),
          ), */
        ),
        menuItemStyleData: MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.only(left: isPadLeft ?? 14.0, right: 0),
        ),
        // onTap: onTap
      ),
    );
  }
}
