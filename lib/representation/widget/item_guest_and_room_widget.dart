import 'package:flutter/material.dart';
import 'package:travel_app/core/const/const_dimension.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';

class ItemGuestAndRoomWidget extends StatefulWidget {
  const ItemGuestAndRoomWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.num,
  });

  final String icon;
  final String title;
  final int num;

  @override
  State<ItemGuestAndRoomWidget> createState() => _ItemGuestAndRoomWidgetState();
}

class _ItemGuestAndRoomWidgetState extends State<ItemGuestAndRoomWidget> {
  late int currentNum;

  @override
  void initState() {
    super.initState();
    currentNum = widget.num;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kItemPadding),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Row(
        children: [
          Image.asset(
            widget.icon,
            height: 40,
            width: 40,
          ),
          const SizedBox(
            width: kItemPadding,
          ),
          Text(widget.title),
          const Spacer(),
          GestureDetector(
            onTap: () {
              setState(() {
                if (currentNum > 1) {
                  currentNum--;
                }
              });
            },
            child: Image.asset(
              AssetHelper.ico_decre,
              height: 40,
              width: 40,
            ),
          ),
          Container(
            height: kDefaultPadding * 2,
            width: kMediumPadding * 2,
            alignment: Alignment.center,
            child: Text('$currentNum'),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                currentNum++;
              });
            },
            child: Image.asset(
              AssetHelper.ico_incre,
              height: 40,
              width: 40,
            ),
          ),
        ],
      ),
    );
  }
}
