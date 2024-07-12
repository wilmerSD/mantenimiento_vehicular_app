import 'package:app_valtx_asistencia/app/providers/assistances_user_provider.dart';
import 'package:app_valtx_asistencia/app/providers/authentication_provider.dart';
import 'package:app_valtx_asistencia/app/providers/justification_user_provider.dart';
import 'package:app_valtx_asistencia/app/providers/register_marking_user_provider.dart';
import 'package:app_valtx_asistencia/app/providers/types_assistances_provider.dart';
import 'package:app_valtx_asistencia/app/providers/types_validations_provider.dart';
import 'package:app_valtx_asistencia/app/providers/user_provider.dart';
import 'package:app_valtx_asistencia/app/repositories/assistances_user_repository.dart';
import 'package:app_valtx_asistencia/app/repositories/authentication_repository.dart';
import 'package:app_valtx_asistencia/app/repositories/justification_user_repository.dart';
import 'package:app_valtx_asistencia/app/repositories/register_marking_user_repository.dart';
import 'package:app_valtx_asistencia/app/repositories/types_assistances_repository.dart';
import 'package:app_valtx_asistencia/app/repositories/types_validations_repository.dart';
import 'package:app_valtx_asistencia/app/repositories/user_repositori.dart';
import 'package:app_valtx_asistencia/core/network/dio_client.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static void initialize() { 
    //NETWORK
    Get.lazyPut<DioClient>(() => DioClient(), fenix: true);

    //STORAGE
    Get.lazyPut<FlutterSecureStorage>(
      () => const FlutterSecureStorage(),
      fenix: true,
    );

    //HIVE

    //PROVIDERS
    Get.lazyPut<AuthenticationProvider>(
      () => AuthenticationProvider(),
      fenix: true,
    );

    Get.lazyPut<UserProvider>(
      () => UserProvider(),
      fenix: true,
    );

    Get.lazyPut<AssistanceMonthUserProvider>(
      () => AssistanceMonthUserProvider(),
      fenix: true,
    );

    Get.lazyPut<AssistanceWeekUserProvider>(
      () => AssistanceWeekUserProvider(),
      fenix: true,
    );

    Get.lazyPut<AssistanceDayUserProvider>(
      () => AssistanceDayUserProvider(),
      fenix: true,
    );

    Get.lazyPut<RegisterMarkingUserProvider>(
      () => RegisterMarkingUserProvider(),
      fenix: true,
    );

    Get.lazyPut<TypesAssistancesProvider>(
      () => TypesAssistancesProvider(),
      fenix: true,
    );

    Get.lazyPut<TypesValidationsProvider>(
      () => TypesValidationsProvider(),
      fenix: true,
    );

    Get.lazyPut<RegisterJustificationUserProvider>(
      () => RegisterJustificationUserProvider(),
      fenix: true,
    );

    Get.lazyPut<GetAllMyRequetsProvider>(
      () => GetAllMyRequetsProvider(),
      fenix: true,
    );

    //REPOSITORIES
    Get.lazyPut<AuthenticationRepository>(
      () => AuthenticationRepository(),
      fenix: true,
    );

    Get.lazyPut<UserRepository>(
      () => UserRepository(),
      fenix: true,
    );

    Get.lazyPut<AssistanceMonthUserRepository>(
      () => AssistanceMonthUserRepository(),
      fenix: true,
    );

    Get.lazyPut<AssistanceWeekUserRepository>(
      () => AssistanceWeekUserRepository(),
      fenix: true,
    );

    Get.lazyPut<AssistanceDayUserRepository>(
      () => AssistanceDayUserRepository(),
      fenix: true,
    );

    Get.lazyPut<RegisterMarkingUserRepository>(
      () => RegisterMarkingUserRepository(),
      fenix: true,
    );

    Get.lazyPut<TypesAssistancesUserRepository>(
      () => TypesAssistancesUserRepository(),
      fenix: true,
    );

    Get.lazyPut<TypesValidationsRepository>(
      () => TypesValidationsRepository(),
      fenix: true,
    );

    Get.lazyPut<RegisterJustificationRepository>(
      () => RegisterJustificationRepository(),
      fenix: true,
    );

    Get.lazyPut<GetAllMyRequetsRepository>(
      () => GetAllMyRequetsRepository(),
      fenix: true,
    );

  }
}
