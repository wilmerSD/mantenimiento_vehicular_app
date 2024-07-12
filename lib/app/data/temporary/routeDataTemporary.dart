import 'package:app_valtx_asistencia/routes/app_routes_name.dart';
import 'package:get/get.dart';

abstract class RouteDataTemporary {
  static RxString currentRoute = AppRoutesName.HOME.obs;
  static int idChecklistToEdit = 0;
  static int idVisitToEdit = 0;
  static int currentIdEvaluation = 0;
  static int idStateOperation = 0;
  static int ope = 0;

  static void reset() {
    currentRoute = AppRoutesName.HOME.obs;
    idChecklistToEdit = 0;
    idVisitToEdit = 0;
    currentIdEvaluation = 0;
    idStateOperation = 0;
  }
}
