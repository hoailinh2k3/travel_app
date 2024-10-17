import 'package:flutter/material.dart';
import 'package:travel_app/core/const/const_dimension.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/representation/widget/app_bar_container.dart';
import 'package:travel_app/representation/widget/button_widget.dart';
import 'package:travel_app/representation/widget/item_guest_and_room_widget.dart';

class GuestAndRoomScreen extends StatefulWidget {
  const GuestAndRoomScreen({super.key});

  static const String routeName = '/guest_and_room_screen';

  @override
  State<GuestAndRoomScreen> createState() => _GuestAndRoomScreenState();
}

class _GuestAndRoomScreenState extends State<GuestAndRoomScreen> {
  int numGuest = 1;
  int numRoom = 1;

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
        implementLeading: true,
        titleString: 'Add Guest And Room',
        child: Column(
          children: [
            const SizedBox(
              height: kMediumPadding * 2,
            ),
            ItemGuestAndRoomWidget(
              icon: AssetHelper.ico_guest,
              title: 'Guest',
              num: numGuest,
            ),
            const SizedBox(
              height: kMediumPadding,
            ),
            ItemGuestAndRoomWidget(
              icon: AssetHelper.ico_room,
              title: 'Room',
              num: numRoom,
            ),
            const SizedBox(
              height: kMediumPadding,
            ),
            ButtonWidget(title: 'Done', onTap: () {}),
            const SizedBox(
              height: kMediumPadding,
            ),
            ButtonWidget(
                title: 'Cancel',
                onTap: () {
                  Navigator.of(context).pop();
                }),
          ],
        ));
  }
}
