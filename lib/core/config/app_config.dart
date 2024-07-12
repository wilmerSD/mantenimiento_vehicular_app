import 'package:app_valtx_asistencia/core/environment/env.dart';

class AppConfig {
  static void initialize() {
    Environment.type = ENV.PROD;
  }
}
