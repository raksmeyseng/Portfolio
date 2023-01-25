import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/app_constant.dart';
import 'package:my_portfolio/constants/asset_path.dart';
import 'package:my_portfolio/widgets/bottom_bar.dart';
import 'package:my_portfolio/widgets/carousel.dart';
import 'package:my_portfolio/widgets/destination_heading.dart';
import 'package:my_portfolio/widgets/discover_heading.dart';
import 'package:my_portfolio/widgets/explore_drawer.dart';
import 'package:my_portfolio/widgets/featured_heading.dart';
import 'package:my_portfolio/widgets/featured_tiles.dart';
import 'package:my_portfolio/widgets/responsive.dart';
import 'package:my_portfolio/widgets/text_widget.dart';
import 'package:my_portfolio/widgets/top_bar_contents.dart';
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
      backgroundColor: Theme.of(context).backgroundColor,
      extendBodyBehindAppBar: true,
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              backgroundColor:
                  Theme.of(context).bottomAppBarColor.withOpacity(_opacity),
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
      drawer: const ExploreDrawer(),
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
                  Column(
                    children: [
                      DiscoverHeading(screenSize: screenSize),
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  FeaturedHeading(
                    screenSize: screenSize,
                  ),
                  FeaturedTiles(screenSize: screenSize)
                ],
              ),
              DestinationHeading(screenSize: screenSize),
              const DestinationCarousel(),
              SizedBox(height: screenSize.height / 10),
              const BottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}
