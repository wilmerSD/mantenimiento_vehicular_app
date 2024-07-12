import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomScaffoldBase extends StatelessWidget {
  const CustomScaffoldBase({
    Key? key,
    this.backgroundColor = Colors.white,
    this.appBarbackgroundColor = Colors.white, //AppColors.kBase,
    this.drawer,
    this.iconThemeColor = Colors.white,
    this.showAppBar = true,
    this.elevation = 0.0,
    this.resizeToAvoidBottomInset,
    this.titleAppBar = "",
    this.showButtonClose = false,
    this.action,
    this.body,
    this.bottomNavigationBar,
    this.floatingActionButton,
  }) : super(key: key);

  final Color? backgroundColor;
  final Color? appBarbackgroundColor;
  final Color? iconThemeColor;
  final Widget? drawer;
  final bool showAppBar;
  final double elevation;
  final bool? resizeToAvoidBottomInset;
  final String titleAppBar;
  final bool showButtonClose;
  final Widget? action;
  final Widget? body;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      drawer: drawer,
      appBar: showAppBar
          ? AppBar(
              backgroundColor: appBarbackgroundColor,
              iconTheme: IconThemeData(color: iconThemeColor),
              elevation: elevation,
              centerTitle: false,
              title: Text(
                titleAppBar,
                style: AppTextStyle(context).bold24(color: AppColors.black),
              ),
              actions: [
                action ?? const SizedBox(),
              ],
            )
          : null,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(
          FocusNode(),
        ),
        child: body,
      ),
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
    );
  }
}
