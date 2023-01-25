import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/app_constant.dart';
import 'package:my_portfolio/constants/asset_path.dart';
import 'package:my_portfolio/widgets/responsive.dart';
import 'package:my_portfolio/widgets/text_widget.dart';

class DestinationCarousel extends StatefulWidget {
  const DestinationCarousel({Key? key}) : super(key: key);

  @override
  _DestinationCarouselState createState() => _DestinationCarouselState();
}

class _DestinationCarouselState extends State<DestinationCarousel> {
  final CarouselController _controller = CarouselController();

  List isHovering = [false, false, false, false, false, false, false];
  List isSelected = [true, false, false, false, false, false, false];

  int _current = 0;

  final List<String> images = [
    AssetPath.ecomerce,
    AssetPath.financial,
    AssetPath.travel,
    AssetPath.foodDelivery,
    AssetPath.workout,
    AssetPath.task,
  ];

  final List<String> places = [
    'E-Commerce',
    'Financial Management',
    'Travel',
    'Food Delivery',
    'Workout & Fitness',
    'Task Management',
  ];

  List<Widget> generateImageTiles(screenSize) {
    return images
        .map(
          (element) => ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              element,
              fit: BoxFit.cover,
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var imageSliders = generateImageTiles(screenSize);

    return Stack(
      children: [
        CarouselSlider(
          items: imageSliders,
          options: CarouselOptions(
              scrollPhysics: ResponsiveWidget.isSmallScreen(context)
                  ? const PageScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              enlargeCenterPage: true,
              aspectRatio: 18 / 8,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                  for (int i = 0; i < imageSliders.length; i++) {
                    if (i == index) {
                      isSelected[i] = true;
                    } else {
                      isSelected[i] = false;
                    }
                  }
                });
              }),
          carouselController: _controller,
        ),
        AspectRatio(
          aspectRatio: 18 / 8,
          child: Center(
            child: TextWidget(
              places[_current],
              font: AppConstant.secondaryFonts,
              size: screenSize.width / 25,
              letterSpacing: 8,
            ),
          ),
        ),
      ],
    );
  }
}
