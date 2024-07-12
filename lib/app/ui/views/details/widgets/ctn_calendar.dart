import 'package:app_valtx_asistencia/app/ui/views/details/details_controller.dart';
import 'package:app_valtx_asistencia/core/helpers/helpers.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

DateRangePickerController _controller = DateRangePickerController();
DateTime now = DateTime.now();
DateTime maxDate = now;
DateTime minDate = DateTime(now.year, now.month, 1);
String currentDate = '';
final helpers = Helpers();

class CtnCalendar extends StatelessWidget {
  const CtnCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsController>(
      builder: (controller) => SfDateRangePicker(
          view: DateRangePickerView.month,
          controller: _controller,
          enablePastDates: true,
          showTodayButton: false,
          allowViewNavigation: false,
          showNavigationArrow: false,
          maxDate: maxDate,
          //minDate: minDate,
          todayHighlightColor: AppColors.primary,
          headerStyle: const DateRangePickerHeaderStyle(
              textAlign: TextAlign.center,
              textStyle: TextStyle(
                  color: AppColors.backgroundColor,
                  locale: Locale('es', 'PE'))),
          selectionTextStyle: const TextStyle(
            color: Colors.white,
          ),
          selectionShape: DateRangePickerSelectionShape.rectangle,
          selectionColor: AppColors.primary,
          monthViewSettings: const DateRangePickerMonthViewSettings(
            viewHeaderStyle: DateRangePickerViewHeaderStyle(
              textStyle: TextStyle(
                color: AppColors.grayBlue,
              ),
            ),
          ),
          onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
            DateTime? selectedDate = args.value;
            currentDate = helpers.formatDateNormal(selectedDate!);
            controller.detailsControllerDates(currentDate);
            controller.assistancesDayUser(currentDate);
          },
          onViewChanged: (DateRangePickerViewChangedArgs args) {
            final newMonth = args.visibleDateRange.startDate;

            //Espera que la vista se construya por completo para llamar a la funcióm
            WidgetsBinding.instance.addPostFrameCallback((_) {
              currentDate = helpers.formatDateNormal(newMonth!);
              controller.formattedDateNow.value = helpers.formatDateNormal(now);

              String formattedDateMonth = helpers.formatDateShort(now);
              String formattedDateChanged = helpers.formatDateShort(newMonth);

              controller.getAssistancesMonthUser(currentDate);
              controller.detailsControllerDates(currentDate);
              //Cuando se vuelve al mes actual que tome la fecha del dia
              if (formattedDateMonth == formattedDateChanged) {
                currentDate = helpers.formatDateNormal(now);
                controller.detailsControllerDates(currentDate);
                return controller
                    .assistancesDayUser(controller.formattedDateNow.value);
              }
              controller.assistancesDayUser(currentDate);
            });
          }),
    );
  }
}
