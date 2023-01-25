import 'package:flutter/material.dart';
import 'package:my_portfolio/config/themes/app_color.dart';
import 'package:my_portfolio/widgets/text_widget.dart';

class ExploreDrawer extends StatefulWidget {
  const ExploreDrawer({
    Key? key,
  }) : super(key: key);

  @override
  _ExploreDrawerState createState() => _ExploreDrawerState();
}

class _ExploreDrawerState extends State<ExploreDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).bottomAppBarColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              InkWell(
                onTap: () {},
                child: const TextWidget(
                  'RAKSMEY SENG',
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
                child: const TextWidget(
                  'Discover',
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {},
                child: const TextWidget(
                  'About',
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {},
                child: const TextWidget(
                  'Contact',
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {},
                child: const TextWidget(
                  'FAQ\'S',
                ),
              ),
              const Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: TextWidget(
                    'Copyright © 2022 Raksmey Seng',
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
