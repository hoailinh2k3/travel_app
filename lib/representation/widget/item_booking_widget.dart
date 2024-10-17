import 'package:flutter/material.dart';
import 'package:travel_app/core/const/const_dimension.dart';
import 'package:travel_app/core/const/const_style.dart';

class ItemBookingWidget extends StatelessWidget {
  const ItemBookingWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.onTap,
  });

  final String icon;
  final String title;
  final String description;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(kItemPadding),
        ),
        child: Row(
          children: [
            Image.asset(
              icon,
              width: 40,
              height: 40,
            ),
            const SizedBox(
              width: kItemPadding,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyles.defaultStyle.light.fontCaption,
                ),
                const SizedBox(
                  height: kItemPadding,
                ),
                Text(
                  description,
                  style: TextStyles.defaultStyle.bold,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
