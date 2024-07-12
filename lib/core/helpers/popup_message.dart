import 'package:app_valtx_asistencia/app/ui/components/alert_dialog_component.dart';
import 'package:get/get.dart';

class PopUpMessages {
  static void show({
    String? title,
    required String message,
    String? textPrimaryButton,
    void Function()? onTapButtonDialog,
    String? image,
    bool? dismissible,
    bool isOnlyPrimary = false,
  }) {
    Get.dialog(
      AlertDialogComponent(
        isDismissibleDialog:
            dismissible ?? PopUpMessages.isDismissible(message),
        imagePathBanner: (image != null) ? image : null,
        title: title == null
            ? PopUpMessages.getErrorTitle(message)
            : PopUpMessages.getErrorTitle(title),
        content: PopUpMessages.getErrorMessage(message),
        isOnlyPrimary: isOnlyPrimary,
        textPrimaryButton: textPrimaryButton ?? getTextButton(message),
        onTapButton: (onTapButtonDialog != null)
            ? onTapButtonDialog
            : () {
                if (message.contains('TIME_OUT')) {
                  Get.back();
                } else if (message.contains('INVALID_TOKEN')) {
                  //Get.offAllNamed(Routes.LOGIN);
                } else if (message.contains('SERVER_ERROR')) {
                  //Get.offAllNamed(Routes.LOGIN);
                } else {
                  Get.back();
                }
              },
      ),
      barrierDismissible: dismissible ?? PopUpMessages.isDismissible(message),
    );
  }

  static bool isDismissible(String message) {
    if (message.contains('NOT_INTERNET_EXCEPTION')) return false;

    switch (message) {
      case 'TIME_OUT':
        return true;
      case 'INVALID_TOKEN':
        return false;
      case 'SERVER_ERROR':
        return false;
      default:
        return true;
    }
  }

  static String getErrorImage(String message) {
    if (message.contains('NOT_INTERNET_EXCEPTION')) return "no_internet.png";

    switch (message) {
      case 'TIME_OUT':
        //value = "${Assets.images.path}time_out.png";
        return "";
      case 'INVALID_TOKEN':
        //value = "${Assets.images.path}error.png";
        return "";
      case 'SERVER_ERROR':
        //value = "${Assets.images.path}error.png";
        return "";
      default:
        //value = "${Assets.images.path}error.png";
        return "";
    }
  }

  static String getErrorTitle(String message) {
    if (message.contains('NOT_INTERNET_EXCEPTION')) return 'Ooops!';

    switch (message) {
      case 'TIME_OUT':
        return 'Sin respuesta';
      case 'INVALID_TOKEN':
        return 'sesión expirada';
      case 'SERVER_ERROR':
        return 'Error';
      case 'REQUIRED':
        return 'Información';
      default:
        return message;
    }
  }

  static String getErrorMessage(String message) {
    if (message.contains('NOT_INTERNET_EXCEPTION')) {
      return 'No se encontró conexión a Internet,\nverifique su conexión';
    }

    switch (message) {
      case 'TIME_OUT':
        return 'Tiempo de espera agotado';
      case 'INVALID_TOKEN':
        return 'Estuvo por mucho tiempo sin actividad\nInicia sesión nuevamente';
      case 'SERVER_ERROR':
        return 'Hubo un error interno, comuniquese con la área de soporte';
      default:
        return message;
    }
  }

  static String getTextButton(String message) {
    if (message.contains('NOT_INTERNET_EXCEPTION')) return 'Reintentar';

    switch (message) {
      case 'TIME_OUT':
        return 'Reintentar';
      case 'INVALID_TOKEN':
        return 'Cerrar sesión';
      case 'SERVER_ERROR':
        return 'Salir';
      default:
        return 'Ok';
    }
  }
}
