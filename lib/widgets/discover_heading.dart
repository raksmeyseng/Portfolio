import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/widgets/responsive.dart';

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
        top: widget.screenSize.height * 0.20,
        left: ResponsiveWidget.isSmallScreen(context)
            ? widget.screenSize.width / 12
            : widget.screenSize.width / 7,
        right: ResponsiveWidget.isSmallScreen(context)
            ? widget.screenSize.width / 12
            : widget.screenSize.width / 3,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Raksmey Seng',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Montserrat',
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Experience \nDesigner',
            style: TextStyle(
              color: Colors.white,
              height: 1.5,
              fontSize: 36,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'I help you design a complete experience of \ninteracting with your brand which includes logo \ndesign, brand identity systems, UX Research and \nUI design for your website or Application.',
            style: TextStyle(
              height: 2,
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Montserrat',
            ),
          ),
          const SizedBox(height: 130),
          latestProjectWidget(),
        ],
      ),
    );
  }

  Widget latestProjectWidget() {
    return ResponsiveWidget.isSmallScreen(context)
        ? SizedBox(
            height: widget.screenSize.height * 0.35,
            child: Container(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Latest Design \nProject.',
                      style: TextStyle(
                        color: Colors.white,
                        height: 1.5,
                        fontSize: 36,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'View the case study and highights of latest brand identity design project for “Craft Amigo”',
                          style: TextStyle(
                            height: 2,
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        const SizedBox(height: 25),
                        Row(
                          children: const [
                            Text(
                              'View Project Highlight',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Montserrat',
                              ),
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
          )
        : SizedBox(
            height: widget.screenSize.height * 0.2,
            child: Container(
              color: Colors.black,
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Latest Design \nProject.',
                      style: TextStyle(
                        color: Colors.white,
                        height: 1.5,
                        fontSize: 36,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'View the case study and highights of latest brand identity design \nproject for “Craft Amigo”',
                          style: TextStyle(
                            height: 2,
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        const SizedBox(height: 25),
                        Row(
                          children: const [
                            Text(
                              'View Project Highlight',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Montserrat',
                              ),
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
