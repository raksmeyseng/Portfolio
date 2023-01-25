import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/widgets/responsive.dart';

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
                const Text(
                  "DISCOVER",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text(
                  "ABOUT",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (ResponsiveWidget.isLargeScreen(context)) ...[
                  const Text(
                    'RAKSMEY SENG',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'Electrolize',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 3,
                    ),
                  ),
                ],
                const Text(
                  "CONTACT",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text(
                  'FAQ\'S',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            // Container(
            //   color: Colors.blueGrey,
            //   width: double.maxFinite,
            //   height: 1,
            // ),
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
        )
        // : Column(
        //     children: [
        //       Row(
        //         mainAxisSize: MainAxisSize.max,
        //         mainAxisAlignment: MainAxisAlignment.spaceAround,
        //         children: [
        //           BottomBarColumn(
        //             heading: 'ABOUT',
        //             s1: 'About',
        //             s2: 'Contact',
        //             s3: 'FAQ\'S',
        //           ),
        //           BottomBarColumn(
        //             heading: 'HELP',
        //             s1: 'Project',
        //             s2: 'Service',
        //             s3: 'Blog',
        //           ),
        //           Container(
        //             color: Colors.blueGrey,
        //             width: 0.5,
        //             height: 150,
        //           ),
        //           socialWidget(),
        //         ],
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: Container(
        //           color: Colors.blueGrey,
        //           width: double.maxFinite,
        //           height: 0.5,
        //         ),
        //       ),
        //       const SizedBox(height: 20),
        //       copyrightWidget(),
        //     ],
        //   ),
        );
  }

  Widget socialWidget() {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Let’s take your ideas to whole another level and\n build a brand around your business.',
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 1.7,
              color: Colors.white,
            ),
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
        children: [
          const Text(
            'Copyright © 2022 Raksmey Seng',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          const SizedBox(width: 5),
          const Divider(height: 1),
          const Text(
            '|',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(width: 5),
          Text(
            'Terms and Conditions',
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 14,
            ),
          ),
          const SizedBox(width: 5),
          const Text(
            '|',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(width: 5),
          Text(
            'Privacy Policy',
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
