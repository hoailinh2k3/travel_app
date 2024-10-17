import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app/core/const/const_color.dart';
import 'package:travel_app/core/const/const_dimension.dart';
import 'package:travel_app/core/const/const_style.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/core/helpers/local_storage_helper.dart';
import 'package:travel_app/representation/screens/main_screen.dart';
import 'package:travel_app/representation/widget/button_widget.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  static const routeName = '/intro_screen';

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  final StreamController<int> _pageStreamController =
      StreamController<int>.broadcast();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      _pageStreamController.add(_pageController.page!.round());
    });
  }

  Widget _buildItemIntroScreen(
      String image, var imageAlignment, String title, String description) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        ),
        Container(
          alignment: imageAlignment,
          child: ImageHelper.loadFromAsset(
            image,
            height: 400,
            fit: BoxFit.fitHeight,
          ),
        ),
        const SizedBox(
          height: kMediumPadding * 2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kMediumPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.defaultStyle.bold,
              ),
              const SizedBox(
                height: kMediumPadding,
              ),
              Text(
                description,
                style: TextStyles.defaultStyle,
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          _buildItemIntroScreen(
              AssetHelper.intro1,
              Alignment.centerRight,
              'Book a flight',
              'Found a flight that matches your destination and schedule ...'),
          _buildItemIntroScreen(
              AssetHelper.intro2,
              Alignment.center,
              'Find a hotel room',
              'Select the day, book your room. We give you the best primary ...'),
          _buildItemIntroScreen(
              AssetHelper.intro3,
              Alignment.centerLeft,
              'Enjoy your trip',
              'Easy discovering new places and share these between your ...'),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
            left: kMediumPadding,
            right: kMediumPadding,
            bottom: MediaQuery.of(context).size.height * 0.05),
        child: Row(
          children: [
            SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              effect: const ExpandingDotsEffect(
                dotWidth: kMinPadding,
                dotHeight: kMinPadding,
                activeDotColor: ConstColor.primaryColor,
              ),
            ),
            const Spacer(),
            StreamBuilder<int>(
                initialData: 0,
                stream: _pageStreamController.stream,
                builder: (context, snapshot) {
                  return ButtonWidget(
                      title: snapshot.data != 2 ? 'Next' : 'Get stated',
                      onTap: () {
                        if (snapshot.data != 2) {
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeIn);
                        } else {
                          LocalStorageHelper.setValue('noIntroScreen', true);
                          Navigator.pushNamed(context, MainScreen.routeName);
                        }
                      });
                }),
          ],
        ),
      ),
    );
  }
}
