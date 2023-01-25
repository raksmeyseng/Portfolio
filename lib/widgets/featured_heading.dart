import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/responsive.dart';
import 'package:my_portfolio/widgets/text_widget.dart';

class FeaturedHeading extends StatelessWidget {
  const FeaturedHeading({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenSize.height * 0.07,
        left: screenSize.width / 10,
        right: screenSize.width / 10,
      ),
      child: ResponsiveWidget.isSmallScreen(context)
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(),
                const TextWidget(
                  'My Service',
                  bold: true,
                  size: 24,
                ),
                const SizedBox(height: 5),
                const TextWidget(
                  'What I do for customer?',
                  textAlign: TextAlign.end,
                ),
                const SizedBox(height: 10),
              ],
            )
          : Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                TextWidget(
                  'My Service',
                  bold: true,
                  size: 40,
                ),
                Expanded(
                  child: TextWidget(
                    'What I do for customer?',
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
    );
  }
}
