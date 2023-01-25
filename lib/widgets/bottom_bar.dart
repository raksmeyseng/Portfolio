import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/widgets/responsive.dart';
import 'package:my_portfolio/widgets/text_widget.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(30),
        color: Theme.of(context).bottomAppBarColor,
        child:
            // ResponsiveWidget.isSmallScreen(context)
            //     ?
            Column(
          children: [
            const SizedBox(height: 50),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const TextWidget(
                  "DISCOVER",
                  bold: true,
                ),
                const TextWidget(
                  "ABOUT",
                  bold: true,
                ),
                if (ResponsiveWidget.isLargeScreen(context)) ...[
                  const TextWidget(
                    'RAKSMEY SENG',
                    bold: true,
                    size: 24,
                  ),
                ],
                const TextWidget(
                  "CONTACT",
                  bold: true,
                ),
                const TextWidget(
                  'FAQ\'S',
                  bold: true,
                ),
              ],
            ),
            const SizedBox(height: 100),
            socialWidget(),
            const SizedBox(height: 50),
            Container(
              color: Colors.white,
              width: double.maxFinite,
              height: 0.5,
            ),
            const SizedBox(height: 20),
            copyrightWidget(),
          ],
        ));
  }

  Widget socialWidget() {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const TextWidget(
            'Let’s take your ideas to whole another level and\n build a brand around your business.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Row(
            children: const [
              FaIcon(
                FontAwesomeIcons.linkedinIn,
                size: 16,
                color: Colors.white,
              ),
              SizedBox(width: 20),
              FaIcon(
                FontAwesomeIcons.facebook,
                size: 16,
                color: Colors.white,
              ),
              SizedBox(width: 20),
              FaIcon(
                FontAwesomeIcons.instagram,
                size: 16,
                color: Colors.white,
              ),
              SizedBox(width: 20),
              FaIcon(
                FontAwesomeIcons.pinterest,
                size: 16,
                color: Colors.white,
              ),
              SizedBox(width: 20),
              FaIcon(
                FontAwesomeIcons.behance,
                size: 16,
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget copyrightWidget() {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          TextWidget(
            'Copyright © 2022 Raksmey Seng',
          ),
          SizedBox(width: 5),
          Divider(height: 1),
          TextWidget(
            '|',
          ),
          SizedBox(width: 5),
          TextWidget(
            'Terms and Conditions',
          ),
          SizedBox(width: 5),
          TextWidget(
            '|',
          ),
          SizedBox(width: 5),
          TextWidget(
            'Privacy Policy',
          ),
        ],
      ),
    );
  }
}
