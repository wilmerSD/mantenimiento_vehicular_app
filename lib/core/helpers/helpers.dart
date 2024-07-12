import 'dart:convert';
import 'package:app_valtx_asistencia/core/helpers/constant.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:app_valtx_asistencia/core/theme/app_text_style.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Helpers {
  static Future<dynamic> loadJsonAssets(String fileName) async {
    final response = await rootBundle.loadString("assets/json/$fileName");
    return json.decode(response);
  }

/*
  static String getFormatedDate(
    String? date, {
    String locale = "es",
    bool showTime = false,
  }) {
    if (date == null || date.isEmpty || date == "null") {
      return "Sin fecha de entrega";
    }

    var inputFormat = locale == "es"
        ? DateFormat('yyyy-MM-dd')
        : DateFormat('dd/MM/yyyy hh:mm');
    var inputDate = inputFormat.parse(date); // ?? DateTime.now().toString()
    var outputFormat = locale == "es"
        ? showTime == true
            ? DateFormat('dd/MM/yyyy hh:mm')
            : DateFormat('dd/MM/yyyy')
        : DateFormat('yyyy-MM-dd hh:mm');
    return outputFormat.format(inputDate);
  }

  static String getFormatLetterDate(String date) {
    if (date == "null") return "-";
    DateTime dateTime = DateTime.parse(date);
    String hour = dateTime.hour < 10 ? "0${dateTime.hour}" : "${dateTime.hour}";
    String minute =
        dateTime.minute < 10 ? "0${dateTime.minute}" : "${dateTime.minute}";
    return "${dateTime.day} de ${getMonth(dateTime.month)} del ${dateTime.year}  $hour:$minute";
  }

  static String convertStringYYYYMMDD(String date) {
    if (date.isEmpty) return "";
    List<String> arr = date.split("/");
    String day = arr[0];
    String month = arr[1];
    String year = arr[2];

    String convertDate = "$year/$month/$day";
    return convertDate;
  }

  static String convertStringDDMMYYYY(String date) {
    List<String> arr;

    if (date.contains("-")) {
      arr = date.split("-");
    } else {
      arr = date.split("/");
    }

    if (arr.length < 3) return "";

    String year = arr[0];
    String month = arr[1];
    String day = arr[2];

    String convertDate = "$day/$month/$year";
    return convertDate;
  }

  static String convertDateYYYYMMDD(String date) {
    List<String> arr;

    if (date.contains("-")) {
      arr = date.split("-");
    } else {
      arr = date.split("/");
    }

    if (arr.length < 3) return "";

    String year = arr[0];
    String month = arr[1];
    String day = arr[2];

    String convertDate = "$day-$month-$year";
    return convertDate;
  }

  static String getMonth(int month) {
    String response = "";
    switch (month) {
      case 1:
        response = "Enero";
        break;
      case 2:
        response = "Febrero";
        break;
      case 3:
        response = "Marzo";
        break;
      case 4:
        response = "Abril";
        break;
      case 5:
        response = "Mayo";
        break;
      case 6:
        response = "Junio";
        break;
      case 7:
        response = "Julio";
        break;
      case 8:
        response = "Agosto";
        break;
      case 9:
        response = "Setiembre";
        break;
      case 10:
        response = "Octubre";
        break;
      case 11:
        response = "Noviembre";
        break;
      case 12:
        response = "Diciembre";
        break;
    }
    return response;
  }

  static String getPaymentStatus(String value) {
    switch (value) {
      case "0":
        return "Pendiente";
      case "1":
        return "Completado";
      case "2":
        return "Pagado";
      case "3":
        return "Falsa parada";
      default:
        return "";
    }
  }

  static Color getChipColorpaymentStatus(String value) {
    switch (value) {
      /*  case "0":
        return const Color.fromRGBO(217, 217, 217, 1.0);
      case "1":
        return const Color.fromRGBO(254, 215, 76, 1.0);
      case "2":
        return AppColors.green;
      case "3":
        return const Color.fromRGBO(47, 119, 234, 1.0);
      case "4":
        return AppColors.red; */

      case "0":
        return const Color.fromRGBO(254, 215, 76, 1.0);
      case "1":
        return AppColors.green;
      case "2":
        return const Color.fromRGBO(47, 119, 234, 1.0);
      case "3":
        return AppColors.red;
      default:
        return const Color.fromRGBO(217, 217, 217, 1.0);
    }
  }

  static Color getColorTextpaymentStatus(String value) {
    switch (value) {
      case "0":
        return AppColors.black;
      /* case "1":
        return AppColors.black; */
      default:
        return Colors.white;
    }
  }

  static String getTypeOfSale(String value) {
    switch (value) {
      case "1":
        return "Tienda virtual";
      case "2":
        return "Manual";
      default:
        return "";
    }
  }

  static Color getChipColorTypeOfSale(String value) {
    switch (value) {
      case "1":
        return const Color.fromRGBO(170, 131, 255, 1.0);
      case "2":
        return const Color.fromRGBO(217, 217, 217, 1.0);
      default:
        return const Color.fromRGBO(217, 217, 217, 1.0);
    }
  }

  static Color getColorTextTypeOfSale(String value) {
    switch (value) {
      case "1":
        return Colors.white;
      default:
        return AppColors.black;
    }
  }

  static String getStatus(String value) {
    switch (value) {
      case "1":
        return "Pendiente";
      case "2":
        return "Confirmado";
      case "3":
        return "Preparando";
      case "4":
        return "En camino";
      case "5":
        return "Entregado";
      case "6":
        return "Rechazado";
      default:
        return "";
    }
  }

  static Color getChipColorStatus(String value) {
    switch (value) {
      case "1":
        return const Color.fromRGBO(217, 217, 217, 1.0);
      case "2":
        return const Color.fromRGBO(47, 119, 234, 1.0);
      case "3":
        return const Color.fromRGBO(47, 119, 234, 1.0);
      case "4":
        return const Color.fromRGBO(47, 119, 234, 1.0);
      case "5":
        return AppColors.green;
      case "6":
        return AppColors.red;
      default:
        return const Color.fromRGBO(217, 217, 217, 1.0);
    }
  }

  static Color getColorTextStatus(String value) {
    switch (value) {
      case "1":
        return AppColors.black;
      default:
        return Colors.white;
    }
  }

  static void launchWhatsapp(
    BuildContext context, {
    String postalCode = "+51",
    required String phoneNumber,
    required String message,
  }) async {
    var url = Uri.parse(
      "whatsapp://send?phone=$postalCode$phoneNumber&text=$message",
    );

    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      await launchUrl(url, mode: LaunchMode.platformDefault);
    }

    /* if (await launchUrl(whatsappAndroid)) {
      await launchUrl(whatsappAndroid);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("WhatsApp is not installed on the device"),
        ),
      );
    } */
  }

  static Future<void> launchInBrowser(String url) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    )) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.platformDefault);
    }
  } 
  void showTypesMarkingDialog(BuildContext context, HomeController controller) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Theme(
            data: ThemeData(
              dialogBackgroundColor: AppColors.backgroundColor,
            ),
            child: controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : controller.responseTypesMarking.isEmpty
                    ? Center(
                        child: Text('${controller.statusMessageTypesMarking}'),
                      )
                    : AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        backgroundColor: AppColors.backgroundColor,
                        title: const Text('Seleccionar tipo de marcación'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: controller.responseTypesMarking.map((type) {
                            return ListTile(
                              title: Text(type.description),
                              onTap: () {
                                Navigator.pop(context, type.idTypesMarking);
                              },
                            );
                          }).toList(),
                        ),
                      ));
      },
    ).then((selectedValue) {
      if (selectedValue != null) {
        controller.assistMarker(selectedValue);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Obx(() => controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : controller.statusAssistance.value
                    ? const AlertRegisterGood()
                    : const AlertRegisterBad());
          },
        );
      }
    });
  } 
  */
  String getMonthName(RxInt month) {
    final monthNames = [
      'Enero',
      'Febrero',
      'Marzo',
      'Abril',
      'Mayo',
      'Junio',
      'Julio',
      'Agosto',
      'Setiembre',
      'Octubre',
      'Noviembre',
      'Diciembre'
    ];
    return monthNames[month.value - 1];
  }

  static DateTime stringToDateTime(String dateTimeString) {
    try {
      final formatter = DateFormat('yyyy/MM/dd');
      return formatter.parse(dateTimeString);
    } catch (e) {
      return DateTime.now();
    }
  }

  static noRequiredDateTime(String? value, String date) {
    RegExp fechaRegex =
        RegExp(r'^(\d{4})/(0[1-9]|1[0-2])/(0[1-9]|1\d|2\d|3[01])$');
    if (value == null || value.isEmpty) {
      return null;
    } else if (!fechaRegex.hasMatch(date)) {
      return "Formato no válido";
    } else {
      return null;
    }
  }

  static noRequiredDateTimeDMY(String? value, String date) {
    RegExp fechaRegex =
        RegExp(r'^(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[012])\/\d{4}$');
    if (value == null || value.isEmpty) {
      return null;
    } else if (!fechaRegex.hasMatch(date)) {
      return "Formato no válido";
    } else {
      return null;
    }
  }

  static String? regexFormSearch(
    String? value,
  ) {
    final regExp = RegExp(r'^$|^[0-9a-zA-ZáéíóúÁÉÍÓÚñÑ\s\-\_\(\)\/]*$');
    if (value == null || value.isEmpty) {
      return null;
    } else if (!regExp.hasMatch(value)) {
      return "Caracteres permitidos '/', '-' , '_' y '()'";
    } else {
      return null;
    }
  }

  /* 📌 comparar fechas en formato yyyy/mm/dd*/
  static int compareDates(String date1, String date2) {
    DateFormat format = DateFormat("yyyy/MM/dd");
    if (date1.isEmpty || date2.isEmpty) {
      return 0;
    }
    try {
      DateTime dateTime1 = format.parseStrict(date1);
      DateTime dateTime2 = format.parseStrict(date2);
      return dateTime1.compareTo(dateTime2);
    } catch (e) {
      // Error de formato de fecha
      return 0;
    }
  }

/* 📌 comparar fechas en formato dd/mm/yyyy*/
  static int compareDatesDMY(String date1, String date2) {
    DateFormat format = DateFormat("dd/MM/yyyy");
    if (date1.isEmpty || date2.isEmpty) {
      return 0;
    }
    try {
      DateTime dateTime1 = format.parseStrict(date1);
      DateTime dateTime2 = format.parseStrict(date2);
      return dateTime1.compareTo(dateTime2);
    } catch (e) {
      // Error de formato de fecha
      return 0;
    }
  }

  /* 📌 Formato del calendario */
  static String dateToStringTime(DateTime dateTime) {
    final formatter = DateFormat('yyyy/MM/dd');
    return formatter.format(dateTime);
  }

  /* 📌 Formato del calendario dd/mm/yyyy */
  static String dateToStringTimeDMY(DateTime dateTime) {
    final formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(dateTime);
  }

  Color getCircleColor(int idValidacion) {
    Color circleColor;
    switch (idValidacion) {
      case 1:
        circleColor = AppColors.validationTimely;
        break;
      case 2:
        circleColor = AppColors.validationLate;
        break;
      case 3:
        circleColor = AppColors.validationMissing;
        break;
      default:
        circleColor = AppColors.validationJustified;
        break;
    }
    return circleColor;
  }

  String getWeekCurrent() {
    final now = DateTime.now();
    // Obtén el día de la semana actual (0 = domingo, 1 = lunes, ..., 6 = sábado)
    final currentDayOfWeek = now.weekday;
    // Calcula la fecha del lunes de la semana actual
    final startOfWeek = now.subtract(Duration(days: currentDayOfWeek - 1));
    // Calcula la fecha del viernes de la semana actual
    final endOfWeek = startOfWeek.add(const Duration(days: 4));
    final format = DateFormat('dd', 'es');
    final monthFormat = DateFormat('MMM', 'es');
    final startDayFormatted = format.format(startOfWeek);
    final endDayFormatted = format.format(endOfWeek);
    final monthFormatted = monthFormat.format(startOfWeek);

    return '$startDayFormatted - $endDayFormatted $monthFormatted.';
  }

  String getDateLarge() {
    final now = DateTime.now();
    final format = DateFormat('EEEE dd \'de\' MMM.', 'es');
    return format.format(now);
  }

  String formatDateNormal(DateTime fecha) {
    final DateFormat formato = DateFormat('yyyy-MM-dd');
    return formato.format(fecha);
  }

  String formatDateShort(DateTime fecha) {
    final DateFormat formato = DateFormat('yyyy-MM');
    return formato.format(fecha);
  }

  static void showSnackBar(
    BuildContext context, {
    required String title,
    required String message,
  }) async {
    Get.snackbar(
      "",
      "",
      duration: const Duration(seconds: 2),
      backgroundColor: AppColors.red,
      titleText: Text(
        title,
        style: AppTextStyle(context).bold16(color: AppColors.backgroundColor),
      ),
      messageText: Text(
        message,
        style: AppTextStyle(context).medium14(color: AppColors.backgroundColor),
      ),
    );
  }

  static void showSnackBarSuccess(
    BuildContext context, {
    required String title,
    required String message,
  }) async {
    Get.snackbar(
      "",
      "",
      duration: const Duration(seconds: 2),
      backgroundColor: AppColors.green,
      titleText: Text(
        title,
        style: AppTextStyle(context).bold16(color: AppColors.backgroundColor),
      ),
      messageText: Text(
        message,
        style: AppTextStyle(context).medium14(color: AppColors.backgroundColor),
      ),
    );
  }

  static Future<void> getShowModalBS(
    BuildContext context, {
    required String title,
    required Widget content,
  }) async {
    await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 50.w,
                  height: 10.h,
                  margin: EdgeInsets.only(bottom: 10.h),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25.0,
                    vertical: 15.0,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(kRadiusNormal.r),
                      topRight: Radius.circular(kRadiusNormal.r),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10.h),
                        child: Text(
                          title,
                          style: AppTextStyle(context).bold16(),
                        ),
                      ),
                      content,
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /* 📌 Comparar que las contraseñas ingresadas sean iguales */
  static String? comparePassword(String firstPass, String secondPass) {
    if (firstPass != secondPass) {
      return "Asegúrate de que las contraseñas sean idénticas";
    } else {
      return null;
    }
  }

  /* 📌 Validar fecha en formato yyyy/MM/dd  */
  static String? validateDateFormat(String? value) {
    if (value == null || value.isEmpty) {
      return "Seleccionar una fecha";
    } else {
      final RegExp dateRegex =
          RegExp(r'^\d{4}\/(0[1-9]|1[0-2])\/(0[1-9]|[12][0-9]|3[01])$');
      if (!dateRegex.hasMatch(value)) {
        return "Formato de fecha inválido";
      }
      return null;
    }
  }

  /* 📌 Validar fecha en formato dd/MM/yyyy */
  static String? validateDateFormatDMY(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    } else {
      final RegExp dateRegex =
          RegExp(r'^(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[012])\/\d{4}$');
      if (!dateRegex.hasMatch(value)) {
        return "Formato de fecha inválido";
      }
      return null;
    }
  }

  /* 📌 Cambiar formato de fecha de yyyy/MM/dd a dd/MM/yyyy */
  static String changeDateToddMMyyyy(String date) {
    DateFormat inputFormat =
        DateFormat('yyyy/MM/dd'); // Define el formato de entrada
    DateFormat outputFormat =
        DateFormat('dd/MM/yyyy'); // Define el formato de salida

    DateTime dateTime =
        inputFormat.parse(date); // Convierte la cadena de texto a DateTime
    String formattedDateString = outputFormat.format(
        dateTime); // Convierte DateTime de vuelta a la cadena de texto con el nuevo formato
    return formattedDateString;
  }

  /* 📌 Cambiar formato de fecha de  dd/MM/yyyy  a yyyy/MM/dd */
  static String changeDateToyyyyMMdd(String date) {
    DateFormat inputFormat =
        DateFormat('dd/MM/yyyy'); // Define el formato de entrada
    DateFormat outputFormat =
        DateFormat('yyyy/MM/dd'); // Define el formato de salida

    DateTime dateTime =
        inputFormat.parse(date); // Convierte la cadena de texto a DateTime
    String formattedDateString = outputFormat.format(
        dateTime); // Convierte DateTime de vuelta a la cadena de texto con el nuevo formato
    return formattedDateString;
  }

  // 📌 Saber que tipo de error es y mostrar un mensaje descriptivo al usuario
   static String knowTypeError(error) {
    if (error.toString().contains('NOT_INTERNET_EXCEPTION')) {
      return kmessageErrorNetwork;
    }
    if (error.toString().contains('TIME_OUT')) {
      return messageErrorOnTimeOut;
    }
    if (error.toString().contains('connection error')) {
      return messageErrorNotResponse;
    } else {
      return kmessageErrorGeneral;
    }

  }

  /* 📌 Cambiar formato de fecha de yyyy/MM/dd a dd/MM/yyyy */
  static String changeDateTodMy(String date) {
    DateFormat inputFormat =
        DateFormat('yyyy-MM-dd'); // Define el formato de entrada
    DateFormat outputFormat =
        DateFormat('dd/MM/yyyy'); // Define el formato de salida

    DateTime dateTime =
        inputFormat.parse(date); // Convierte la cadena de texto a DateTime
    String formattedDateString = outputFormat.format(
        dateTime); // Convierte DateTime de vuelta a la cadena de texto con el nuevo formato
    return formattedDateString;
  }
}
