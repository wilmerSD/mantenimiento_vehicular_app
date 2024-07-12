import 'package:app_valtx_asistencia/app/local/push_notification_service.dart';
import 'package:app_valtx_asistencia/core/config/app_config.dart';
import 'package:app_valtx_asistencia/core/helpers/dependency_injection.dart';
import 'package:app_valtx_asistencia/core/network/dio_config.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/routes/app_routes.dart';
import 'package:app_valtx_asistencia/routes/app_routes_name.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  DependencyInjection.initialize();
  // Initializing Firebase
  await Firebase.initializeApp();
  //await PushNotificationService.inicializeApp();
  PushNotificationService.inicializeLocalNotification();

  AppConfig.initialize();
  DioConfig.initialize();
  DependencyInjection.initialize();
  initializeDateFormatting('es', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844) /* ScreenUtil.defaultSize */,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale("es"),
        ],
        title: 'Mantenimiento vehicular',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.blueDark,
            brightness: Brightness.light,
            
          ),
          useMaterial3: true,
          datePickerTheme: DatePickerThemeData(
            headerBackgroundColor: AppColors.primary,
            surfaceTintColor: Colors.white,
            shape: RoundedRectangleBorder(
                    side:const BorderSide(width: 0.0),
                    borderRadius: BorderRadius.circular(
                      15.0,
                    ),
                  ),
            headerForegroundColor: Colors.white,
            /* dayStyle:TextStyle(color: Colors.red, ) , */
           /*  todayBackgroundColor:  MaterialStateProperty.all(AppColors.blueDark), */
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutesName.SPLASH,
        getPages: AppRoutes.routes,
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: GlowRemover(),
            child: child!,
          );
        },
      ),
    );
  }
}

/// Remueve la burbuja al hacer scroll
class GlowRemover extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(context, child, axisDirection) {
    const GlowingOverscrollIndicator(
      color: Colors.transparent,
      axisDirection: AxisDirection.up,
    );
    return child;
  }
}

//   WidgetsFlutterBinding.ensureInitialized();//asegura que los widgets estén inicializados antes de ejecutar la aplicacion
    /* SystemChrome.setPreferredOrientations([//orientacion de la app, solo vertical
     DeviceOrientation.portraitUp,
     DeviceOrientation.portraitDown,
   ]); */
//   AppConfig.initialize();
//   DioConfig.initialize();
//   DependencyInjection.initialize();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
    
//    return ScreenUtilInit(
//       designSize: ScreenUtil.defaultSize,
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder: (context, child) => GetMaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'VALTX',
//         theme: ThemeData(
//           fontFamily: 'Montserrat',
//           primarySwatch: Colors.red,
//         ),
//         /* localizationsDelegates: const [
//           GlobalMaterialLocalizations.delegate,
//           GlobalWidgetsLocalizations.delegate,
//           GlobalCupertinoLocalizations.delegate,
//           DefaultWidgetsLocalizations.delegate,
//         ], */
//         supportedLocales: const [
//           Locale("es"),
//         ],
//         initialRoute: AppRoutesName.DETAIL,
//         getPages: AppRoutes.routes,
//         builder: (context, child) {
//           return ScrollConfiguration(
//             behavior: GlowRemover(),
//             child: child!,
//           );
//         },
//       ),
//     );
//   }
// }

