import 'package:app_valtx_asistencia/app/ui/views/splash/splash_controller.dart';
import 'package:app_valtx_asistencia/app/ui/views/splash/widgets/splash_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
	const SplashView({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return GetBuilder<SplashController>(
			builder: (controller) => const Scaffold(
				body: SplashContent(),
				),
		);
	}
}
