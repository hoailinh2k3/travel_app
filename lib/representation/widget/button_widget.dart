import 'package:flutter/material.dart';
import 'package:travel_app/core/const/const_color.dart';
import 'package:travel_app/core/const/const_dimension.dart';
import 'package:travel_app/core/const/const_style.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.title, required this.onTap});

  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: kMediumPadding * 2,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: kMediumPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kMediumPadding),
          gradient: Gradients.defaultGradientBackground,
        ),
        child: Text(
          title,
          style: TextStyles.defaultStyle.bold.whiteTextColor,
        ),
      ),
    );
  }
}
