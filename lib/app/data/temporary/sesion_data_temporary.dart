import 'package:app_valtx_asistencia/app/data/temporary/routeDataTemporary.dart';

abstract class SesionDataTemporary {
  static Map<String, dynamic> data = {};
  static String currentToken = "";
  static String currentRefreshToken = "";
  static Duration timeToExpire = const Duration(minutes: 15);
  static void reset() {
    data = {};
    currentToken = "";
    currentRefreshToken = "";
    timeToExpire = const Duration(minutes: 0);
    RouteDataTemporary.reset();
  }

  static init() {
    int exp = data["exp"] * 1000;
    final date = DateTime.fromMillisecondsSinceEpoch(exp)
        .subtract(const Duration(minutes: 1));
    if (date.difference(DateTime.now()).inMinutes < 1) {
      timeToExpire = const Duration(minutes: 1);
    } else {
      timeToExpire = date.difference(DateTime.now());
    }
  }
}
