
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomLayoutBuilder extends StatelessWidget {
  const CustomLayoutBuilder({
    Key? key,
    this.showAppBar = false,
    this.appBarbackgroundColor = Colors.white,
    this.iconThemeColor = Colors.white,
    this.elevation = 0.0,
    this.titleAppBar = "",
    this.header,
    this.action,
    required this.body,
    this.footer,
    this.isScrollable = true,
  }) : super(key: key);

  final Color? iconThemeColor;
  final Color? appBarbackgroundColor;
  final bool showAppBar;
  final String titleAppBar;
  final double elevation;
  final Widget? header;
  final Widget? action;
  final Widget body;
  final Widget? footer;
  final bool isScrollable;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, //AppColors.kBase,
      resizeToAvoidBottomInset: false,
      appBar: showAppBar
          ? AppBar(
              backgroundColor: appBarbackgroundColor,
              iconTheme: const IconThemeData(color: AppColors.black),
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
      body: SafeArea(
        top: false,
        bottom: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(
                FocusNode(),
              ),
              child: SingleChildScrollView(
                physics: isScrollable
                    ? const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics(),
                      )
                    : const NeverScrollableScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        header ?? const SizedBox(),
                        Expanded(child: body),
                        footer ?? const SizedBox(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
