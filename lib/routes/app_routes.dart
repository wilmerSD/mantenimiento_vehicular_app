import 'package:app_valtx_asistencia/app/ui/views/changepass/changepass_binding.dart';
import 'package:app_valtx_asistencia/app/ui/views/changepass/changepass_view.dart';
import 'package:app_valtx_asistencia/app/ui/views/home/home_binding.dart';
import 'package:app_valtx_asistencia/app/ui/views/home/home_view.dart';
import 'package:app_valtx_asistencia/app/ui/views/login/login_binding.dart';
import 'package:app_valtx_asistencia/app/ui/views/login/login_view.dart';
import 'package:app_valtx_asistencia/app/ui/views/details/details_binding.dart';
import 'package:app_valtx_asistencia/app/ui/views/details/details_view.dart';
import 'package:app_valtx_asistencia/app/ui/views/login/recoverPassword/recover_password_binding.dart';
import 'package:app_valtx_asistencia/app/ui/views/login/recoverPassword/recover_password_view.dart';
import 'package:app_valtx_asistencia/app/ui/views/permission/permission_binding.dart';
import 'package:app_valtx_asistencia/app/ui/views/permission/permission_view.dart';
import 'package:app_valtx_asistencia/app/ui/views/schedule/schedule_binding.dart';
import 'package:app_valtx_asistencia/app/ui/views/schedule/schedule_view.dart';
import 'package:app_valtx_asistencia/app/ui/views/request_box/request_box_binding.dart';
import 'package:app_valtx_asistencia/app/ui/views/request_box/request_box_view.dart';
import 'package:app_valtx_asistencia/app/ui/views/splash/splash_binding.dart';
import 'package:app_valtx_asistencia/app/ui/views/splash/splash_view.dart';
import 'package:app_valtx_asistencia/routes/app_routes_name.dart';
import 'package:get/get.dart';

abstract class AppRoutes {
  static final routes = [
    GetPage(
      name: AppRoutesName.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutesName.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutesName.DETAIL,
      page: () => const DetailView(),
      binding: DetailBinding(),
    ),
    GetPage(
      name: AppRoutesName.LOGIN,
      page: () => const LoginView(),
      binding: LoginBiding(),
    ),
    GetPage(
        name: AppRoutesName.PERMISSION,
        page: () => const PermissionView(),
        binding: PermissionBinding()),
    GetPage(
        name: AppRoutesName.REQUESTBOX,
        page: () => const RequestBoxView(),
        binding: RequestBoxBinding()),
    GetPage(
      name: AppRoutesName.SCHEDULE,
      page: () => const ScheduleView(),
      binding: ScheduleBiding(),
    ),
    GetPage(
      name: AppRoutesName.CHANGEPASS,
      page: () => const ChangePassView(),
      binding: ChangePassBinding(),
    ),
    GetPage(
      name: AppRoutesName.RECOVERPASS,
      page: () => const RecoverPasswordView(),
      binding: RecoverPasswordBinding(),
    )
  ];
}
