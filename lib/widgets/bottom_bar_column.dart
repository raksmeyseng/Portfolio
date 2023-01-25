import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/text_widget.dart';

class BottomBarColumn extends StatelessWidget {
  final String heading;
  final String season1;
  final String season2;
  final String season3;

  const BottomBarColumn(
    Key? key, {
    required this.heading,
    required this.season1,
    required this.season2,
    required this.season3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            heading,
            bold: true,
            size: 18,
          ),
          const SizedBox(height: 10),
          TextWidget(season1),
          const SizedBox(height: 10),
          TextWidget(season2),
          const SizedBox(height: 10),
          TextWidget(season3),
        ],
      ),
    );
  }
}
