import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:travel_app/core/const/const_color.dart';
import 'package:travel_app/core/const/const_dimension.dart';
import 'package:travel_app/representation/widget/app_bar_container.dart';
import 'package:travel_app/representation/widget/button_widget.dart';

class SelectDateScreen extends StatefulWidget {
  const SelectDateScreen({super.key});

  static const routeName = '/select_date_screen';

  @override
  State<SelectDateScreen> createState() => _SelectDateScreenState();
}

class _SelectDateScreenState extends State<SelectDateScreen> {
  DateTime? rangeStartDate;
  DateTime? rangeEndDate;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Nhận tham số từ Navigator.pushNamed
    final arguments = ModalRoute.of(context)?.settings.arguments as Map?;

    if (arguments != null) {
      rangeStartDate = arguments['rangeStartDate'] ?? DateTime.now();
      rangeEndDate = arguments['rangeEndDate'] ??
          DateTime.now().add(const Duration(days: 1));
    } else {
      rangeStartDate = DateTime.now();
      rangeEndDate = DateTime.now().add(const Duration(days: 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      implementLeading: true,
      titleString: 'Select Date',
      child: Column(
        children: [
          const SizedBox(
            height: kMediumPadding * 2,
          ),
          SfDateRangePicker(
            view: DateRangePickerView.month,
            selectionMode: DateRangePickerSelectionMode.range,
            selectionColor: ConstColor.primaryColor,
            startRangeSelectionColor: ConstColor.secondColor,
            endRangeSelectionColor: ConstColor.primaryColor,
            rangeSelectionColor: ConstColor.primaryColor.withOpacity(0.25),
            todayHighlightColor: ConstColor.primaryColor,
            toggleDaySelection: true,
            initialSelectedRange: PickerDateRange(
              rangeStartDate,
              rangeEndDate,
            ),
            onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
              if (args.value is PickerDateRange) {
                setState(() {
                  rangeStartDate = args.value.startDate;
                  rangeEndDate = args.value.endDate;
                });
              } else {
                rangeStartDate = null;
                rangeEndDate = null;
              }
            },
          ),
          const SizedBox(
            height: kMediumPadding,
          ),
          ButtonWidget(
              title: 'Select',
              onTap: () {
                Navigator.of(context).pop([rangeStartDate, rangeEndDate]);
              }),
          const SizedBox(
            height: kMediumPadding,
          ),
          ButtonWidget(
              title: 'Cancel',
              onTap: () {
                Navigator.of(context).pop([rangeStartDate, rangeEndDate]);
              }),
        ],
      ),
    );
  }
}
