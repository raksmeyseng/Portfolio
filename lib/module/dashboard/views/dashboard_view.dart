import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/config/themes/app_color.dart';
import 'package:my_portfolio/constants/app_constant.dart';
import 'package:my_portfolio/constants/asset_path.dart';
import 'package:my_portfolio/languages/generated/l10n.dart';
import 'package:my_portfolio/widgets/responsive.dart';
import 'package:my_portfolio/widgets/text_widget.dart';
import 'package:my_portfolio/widgets/web_scrollbar.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  late ScrollController _scrollController;
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      extendBodyBehindAppBar: true,
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              backgroundColor: Theme.of(context)
                  .colorScheme
                  .background
                  .withOpacity(_opacity),
              elevation: 0,
              centerTitle: true,
              title: TextWidget(
                AppConstant.appName.toUpperCase(),
                font: AppConstant.secondaryFonts,
              ),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 1000),
              child: TopBarContents(null, opacity: _opacity),
            ),
      drawer: const _ExploreDrawer(),
      body: WebScrollbar(
        color: Colors.blueGrey,
        backgroundColor: Colors.blueGrey.withOpacity(0.3),
        width: 10,
        heightFraction: 0.3,
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: screenSize.height,
                    width: screenSize.width,
                    child: Image.asset(
                      AssetPath.cover,
                      fit: BoxFit.cover,
                    ),
                  ),
                  _DiscoverHeading(screenSize: screenSize),
                ],
              ),
              Column(
                children: [
                  _FeaturedHeading(screenSize: screenSize),
                  _FeaturedTiles(screenSize: screenSize)
                ],
              ),
              _DestinationHeading(screenSize: screenSize),
              const _DestinationCarousel(),
              SizedBox(height: screenSize.height / 10),
              const _BottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ExploreDrawer extends StatelessWidget {
  const _ExploreDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).colorScheme.background,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              InkWell(
                onTap: () {},
                child: TextWidget(
                  AppConstant.appName.toUpperCase(),
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Divider(
                  color: AppColor.divider,
                  thickness: 0.5,
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {},
                child: TextWidget(
                  S.of(context).discover,
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {},
                child: TextWidget(
                  S.of(context).about,
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {},
                child: TextWidget(
                  S.of(context).contact,
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {},
                child: TextWidget(
                  S.of(context).faq,
                ),
              ),
              const Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: TextWidget(
                    AppConstant.copyRight,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _FeaturedTiles extends StatelessWidget {
  _FeaturedTiles({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  final List<String> assets = [
    AssetPath.brandIdentity,
    AssetPath.uxResearch,
    AssetPath.webApp,
  ];

  final List<String> title = [
    S.current.brand_identity_design,
    S.current.ux_research,
    S.current.web_app_design,
  ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? Padding(
            padding: EdgeInsets.only(top: screenSize.height / 50),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: screenSize.width / 10),
                  ...Iterable<int>.generate(assets.length).map(
                    (int pageIndex) => Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: screenSize.width / 2.5,
                              width: screenSize.width / 1.5,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image.asset(
                                  assets[pageIndex],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: screenSize.height / 70,
                              ),
                              child: TextWidget(
                                title[pageIndex],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: screenSize.width / 15),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : Padding(
            padding: EdgeInsets.only(
              top: screenSize.height * 0.06,
              left: screenSize.width / 15,
              right: screenSize.width / 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...Iterable<int>.generate(assets.length).map(
                  (int pageIndex) => Column(
                    children: [
                      SizedBox(
                        height: screenSize.width / 6,
                        width: screenSize.width / 3.8,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            assets[pageIndex],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: screenSize.height / 70,
                        ),
                        child: TextWidget(
                          title[pageIndex],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}

class FloatingQuickAccessBar extends StatefulWidget {
  const FloatingQuickAccessBar({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  _FloatingQuickAccessBarState createState() => _FloatingQuickAccessBarState();
}

class _FloatingQuickAccessBarState extends State<FloatingQuickAccessBar> {
  List isHovering = [false, false, false, false];
  List<Widget> rowElements = [];

  List<String> items = [
    S.current.project.toUpperCase(),
    S.current.service.toUpperCase(),
    S.current.blog.toUpperCase(),
    S.current.resource.toUpperCase(),
  ];
  List<IconData> icons = [
    FontAwesomeIcons.rProject,
    FontAwesomeIcons.servicestack,
    FontAwesomeIcons.blog,
    FontAwesomeIcons.briefcase,
  ];

  List<Widget> generateRowElements() {
    rowElements.clear();
    for (int i = 0; i < items.length; i++) {
      Widget elementTile = InkWell(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onHover: (value) {
          setState(() {
            value ? isHovering[i] = true : isHovering[i] = false;
          });
        },
        onTap: () {},
        child: Text(
          items[i],
          style: TextStyle(
            color: isHovering[i]
                ? Theme.of(context).primaryTextTheme.labelLarge!.decorationColor
                : Theme.of(context).primaryTextTheme.labelLarge!.color,
          ),
        ),
      );
      Widget spacer = SizedBox(
        height: widget.screenSize.height / 20,
        child: VerticalDivider(
          width: 1,
          color: Colors.blueGrey[100],
          thickness: 1,
        ),
      );
      rowElements.add(elementTile);
      if (i < items.length - 1) {
        rowElements.add(spacer);
      }
    }

    return rowElements;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 1,
      child: Padding(
        padding: EdgeInsets.only(
          top: widget.screenSize.height * 0.40,
          left: ResponsiveWidget.isSmallScreen(context)
              ? widget.screenSize.width / 12
              : widget.screenSize.width / 5,
          right: ResponsiveWidget.isSmallScreen(context)
              ? widget.screenSize.width / 12
              : widget.screenSize.width / 5,
        ),
        child: ResponsiveWidget.isSmallScreen(context)
            ? Column(
                children: [
                  ...Iterable<int>.generate(items.length).map(
                    (int pageIndex) => Padding(
                      padding:
                          EdgeInsets.only(top: widget.screenSize.height / 80),
                      child: Card(
                        color: Theme.of(context).cardColor,
                        elevation: 4,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: widget.screenSize.height / 45,
                              bottom: widget.screenSize.height / 45,
                              left: widget.screenSize.width / 20),
                          child: Row(
                            children: [
                              Icon(
                                icons[pageIndex],
                                color: Colors.white,
                              ),
                              SizedBox(width: widget.screenSize.width / 20),
                              InkWell(
                                splashColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                onTap: () {},
                                child: Text(
                                  items[pageIndex],
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .primaryTextTheme
                                        .labelLarge!
                                        .color,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Card(
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: widget.screenSize.height / 50,
                    bottom: widget.screenSize.height / 50,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: generateRowElements(),
                  ),
                ),
              ),
      ),
    );
  }
}

class _FeaturedHeading extends StatelessWidget {
  const _FeaturedHeading({
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

class _DiscoverHeading extends StatefulWidget {
  const _DiscoverHeading({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  State<_DiscoverHeading> createState() => _DiscoverHeadingState();
}

class _DiscoverHeadingState extends State<_DiscoverHeading> {
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

class _DestinationHeading extends StatelessWidget {
  const _DestinationHeading({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? Container(
            padding: EdgeInsets.only(
              top: screenSize.height / 20,
              bottom: screenSize.height / 20,
            ),
            width: screenSize.width,
            // color: Colors.black,
            child: const TextWidget(
              'Project Case Studies',
              bold: true,
              size: 24,
              textAlign: TextAlign.center,
            ),
          )
        : Container(
            padding: EdgeInsets.only(
              top: screenSize.height / 10,
              bottom: screenSize.height / 15,
            ),
            width: screenSize.width,
            // color: Colors.black,
            child: const TextWidget(
              'Project Case Studies',
              bold: true,
              textAlign: TextAlign.center,
              size: 40,
            ),
          );
  }
}

class _DestinationCarousel extends StatefulWidget {
  const _DestinationCarousel({Key? key}) : super(key: key);

  @override
  _DestinationCarouselState createState() => _DestinationCarouselState();
}

class _DestinationCarouselState extends State<_DestinationCarousel> {
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

class _BottomBar extends StatelessWidget {
  const _BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(30),
        color: Theme.of(context).colorScheme.background,
        child: Column(
          children: [
            const SizedBox(height: 50),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextWidget(
                  S.of(context).discover.toUpperCase(),
                  bold: true,
                ),
                TextWidget(
                  S.of(context).about.toUpperCase(),
                  bold: true,
                ),
                if (ResponsiveWidget.isLargeScreen(context)) ...[
                  TextWidget(
                    AppConstant.appName.toUpperCase(),
                    bold: true,
                    size: 24,
                  ),
                ],
                TextWidget(
                  S.of(context).contact.toUpperCase(),
                  bold: true,
                ),
                TextWidget(
                  S.of(context).faq.toUpperCase(),
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
        children: [
          const TextWidget(
            AppConstant.copyRight,
          ),
          const SizedBox(width: 5),
          const Divider(height: 1),
          const TextWidget(
            AppConstant.divider,
          ),
          const SizedBox(width: 5),
          TextWidget(
            S.current.term_condition,
          ),
          const SizedBox(width: 5),
          const TextWidget(
            AppConstant.divider,
          ),
          const SizedBox(width: 5),
          TextWidget(
            S.current.privacy_policy,
          ),
        ],
      ),
    );
  }
}

class TopBarContents extends StatefulWidget {
  final double opacity;

  const TopBarContents(
    Key? key, {
    required this.opacity,
  }) : super(key: key);

  @override
  _TopBarContentsState createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  final List _isHovering = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: Container(
        color: Theme.of(context)
            .colorScheme
            .background
            .withOpacity(widget.opacity),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: screenSize.width / 8),
              TextWidget(
                AppConstant.appName.toUpperCase(),
                bold: true,
                font: AppConstant.secondaryFonts,
                size: 20,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: screenSize.width / 8),
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[0] = true
                              : _isHovering[0] = false;
                        });
                      },
                      onTap: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextWidget(
                            S.of(context).discover.toUpperCase(),
                            color: _isHovering[0]
                                ? Colors.blue[200]
                                : Colors.white,
                          ),
                          const SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[0],
                            child: Container(
                              height: 2,
                              width: 20,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: screenSize.width / 20),
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[1] = true
                              : _isHovering[1] = false;
                        });
                      },
                      onTap: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextWidget(
                            S.of(context).about.toUpperCase(),
                            color: _isHovering[1]
                                ? Colors.blue[200]
                                : Colors.white,
                          ),
                          const SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[1],
                            child: Container(
                              height: 2,
                              width: 20,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: screenSize.width / 20),
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[2] = true
                              : _isHovering[2] = false;
                        });
                      },
                      onTap: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextWidget(
                            S.of(context).contact.toUpperCase(),
                            color: _isHovering[2]
                                ? Colors.blue[200]
                                : Colors.white,
                          ),
                          const SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[2],
                            child: Container(
                              height: 2,
                              width: 20,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: screenSize.width / 20),
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[3] = true
                              : _isHovering[3] = false;
                        });
                      },
                      onTap: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextWidget(
                            S.of(context).faq.toUpperCase(),
                            color: _isHovering[3]
                                ? Colors.blue[200]
                                : Colors.white,
                          ),
                          const SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[3],
                            child: Container(
                              height: 2,
                              width: 20,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: screenSize.width / 50),
            ],
          ),
        ),
      ),
    );
  }
}
