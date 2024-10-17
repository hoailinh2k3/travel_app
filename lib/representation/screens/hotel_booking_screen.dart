import 'package:flutter/material.dart';
import 'package:travel_app/core/const/const_dimension.dart';
import 'package:travel_app/core/extensions/date_ext.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/representation/screens/guest_and_room_screen.dart';
import 'package:travel_app/representation/screens/select_date_screen.dart';
import 'package:travel_app/representation/widget/app_bar_container.dart';
import 'package:travel_app/representation/widget/button_widget.dart';
import 'package:travel_app/representation/widget/item_booking_widget.dart';

class HotelBookingScreen extends StatefulWidget {
  const HotelBookingScreen({super.key});

  static const String routeName = '/hotel_booking_screen';

  @override
  State<HotelBookingScreen> createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState extends State<HotelBookingScreen> {
  DateTime rangeStartDate = DateTime.now();
  DateTime rangeEndDate = DateTime.now().add(const Duration(days: 1));

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      implementLeading: true,
      titleString: 'Hotel Booking',
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: kMediumPadding * 2,
            ),
            ItemBookingWidget(
              icon: AssetHelper.location,
              title: 'Destination',
              description: 'description',
              onTap: () {},
            ),
            const SizedBox(
              height: kMediumPadding,
            ),
            StatefulBuilder(builder: (context, setState) {
              return ItemBookingWidget(
                icon: AssetHelper.calendar,
                title: 'Select Date',
                description:
                    '${rangeStartDate.getStartDate} - ${rangeEndDate.getEndDate}',
                onTap: () async {
                  final result = await Navigator.pushNamed(
                      context, SelectDateScreen.routeName,
                      arguments: {
                        'rangeStartDate': rangeStartDate,
                        'rangeEndDate': rangeEndDate,
                      });
                  if (result != null &&
                      result is List<DateTime?> &&
                      !result.any((element) => element == null)) {
                    if (result[0]!.isAfter(DateTime.now()) ||
                        result[0]!.isAtSameMomentAs(DateTime.now())) {
                      setState(() {
                        rangeStartDate = result[0]!;
                        rangeEndDate = result[1]!;
                      });
                    } else {
                      setState(() {
                        rangeStartDate = DateTime.now();
                        rangeEndDate =
                            DateTime.now().add(const Duration(days: 1));
                      });
                    }
                  }
                },
              );
            }),
            const SizedBox(
              height: kMediumPadding,
            ),
            StatefulBuilder(builder: (context, StepState) {
              return ItemBookingWidget(
                icon: AssetHelper.bed,
                title: 'Guest and Room',
                description: 'description',
                onTap: () {
                  Navigator.of(context).pushNamed(GuestAndRoomScreen.routeName);
                },
              );
            }),
            const SizedBox(
              height: kMediumPadding,
            ),
            ButtonWidget(
              title: 'Search',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
