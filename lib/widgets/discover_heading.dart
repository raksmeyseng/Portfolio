import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/constants/app_constant.dart';
import 'package:my_portfolio/widgets/responsive.dart';
import 'package:my_portfolio/widgets/text_widget.dart';

class DiscoverHeading extends StatefulWidget {
  const DiscoverHeading({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  State<DiscoverHeading> createState() => _DiscoverHeadingState();
}

class _DiscoverHeadingState extends State<DiscoverHeading> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: widget.screenSize.height * 0.3,
        left: ResponsiveWidget.isSmallScreen(context)
            ? widget.screenSize.width / 12
            : widget.screenSize.width / 7,
        right: ResponsiveWidget.isSmallScreen(context)
            ? widget.screenSize.width / 12
            : widget.screenSize.width / 3,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          TextWidget(
            AppConstant.appName,
          ),
          SizedBox(height: 20),
          TextWidget(
            'Experience \nDesigner',
            bold: true,
            size: 70,
          ),
          SizedBox(height: 20),
          TextWidget(
            'I help you design a complete experience of \ninteracting with your brand which includes logo \ndesign, brand identity systems, UX Research and \nUI design for your website or Application.',
            height: 2,
          ),
          //  SizedBox(height: 130),
          // latestProjectWidget(),
        ],
      ),
    );
  }

  Widget latestProjectWidget() {
    return ResponsiveWidget.isSmallScreen(context)
        ? SizedBox(
            height: widget.screenSize.height * 0.35,
            width: widget.screenSize.width,
            child: Container(
              color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TextWidget(
                    'Latest Design \nProject.',
                    bold: true,
                    size: 36,
                  ),
                  const SizedBox(height: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const TextWidget(
                        'View the case study and highights of latest brand identity design project for “Craft Amigo”',
                      ),
                      const SizedBox(height: 25),
                      Row(
                        children: const [
                          TextWidget(
                            'View Project Highlight',
                          ),
                          SizedBox(width: 16),
                          FaIcon(
                            FontAwesomeIcons.arrowRight,
                            size: 16,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        : SizedBox(
            height: widget.screenSize.height * 0.2,
            width: widget.screenSize.width,
            child: Container(
              color: Colors.black,
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextWidget(
                      'Latest Design \nProject.',
                      bold: true,
                      size: 36,
                    ),
                    const SizedBox(width: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const TextWidget(
                          'View the case study and highights of latest brand identity design \nproject for “Craft Amigo”',
                        ),
                        const SizedBox(height: 25),
                        Row(
                          children: const [
                            TextWidget(
                              'View Project Highlight',
                            ),
                            SizedBox(width: 16),
                            FaIcon(
                              FontAwesomeIcons.arrowRight,
                              size: 16,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
