// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pixelfield_test/core/util/palette.dart';
import 'package:pixelfield_test/features/collection/presentation/screen/collection_page.dart';
import 'package:pixelfield_test/features/scan/presentation/screen/scan_page.dart';
import 'package:pixelfield_test/features/settings/presentation/screen/settings_page.dart';
import 'package:pixelfield_test/features/shop/presentation/screen/shop_page.dart';
import 'package:pixelfield_test/generated/assets.dart';

class BottomNavBar extends StatefulWidget {
  final int? index;

  const BottomNavBar({super.key, this.index});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int currentPageIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this, initialIndex: 1);
    currentPageIndex = 1;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      tabController.addListener(() {
        if (mounted) {
          setState(() {
            currentPageIndex = tabController.index;
          });
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: RepaintBoundary(
        child: Scaffold(
          backgroundColor: Palette.backgroundColor,
          key: _scaffoldKey,
          bottomNavigationBar: Container(
            height: 0.10.sh,
            decoration: BoxDecoration(color: Palette.mainDarkColor),
            child: TabBar(
              dividerColor: Colors.transparent,
              labelColor: Palette.whiteColor,
              indicatorColor: Colors.transparent,
              labelPadding: const EdgeInsets.symmetric(horizontal: 0),
              unselectedLabelColor: Palette.whiteColor.withOpacity(0.5),
              isScrollable: false,
              labelStyle: TextStyle(
                height: 0,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                fontFamily: 'Inter',
              ),
              onTap: (index) {
                setState(() {
                  currentPageIndex = index;
                });
              },
              controller: tabController,
              tabs: <Widget>[
                BottomBarItemWidget(
                  color: currentPageIndex == 0
                      ? Palette.whiteColor
                      : Palette.whiteColor.withOpacity(0.5),
                  text: 'Scan',
                  assetName: Assets.svgsScan,
                ),
                BottomBarItemWidget(
                  color: currentPageIndex == 1
                      ? Palette.whiteColor
                      : Palette.whiteColor.withOpacity(0.5),
                  text: 'Collection',
                  assetName: Assets.svgsSquaresFour,
                ),
                BottomBarItemWidget(
                  color: currentPageIndex == 2
                      ? Palette.whiteColor
                      : Palette.whiteColor.withOpacity(0.5),
                  text: 'Shop',
                  assetName: Assets.svgsBottle,
                ),
                BottomBarItemWidget(
                  color: currentPageIndex == 3
                      ? Palette.whiteColor
                      : Palette.whiteColor.withOpacity(0.5),
                  text: 'Settings',
                  assetName: Assets.svgsGearSix,
                ),
              ],
            ),
          ),
          body: TabBarView(
            controller: tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              ScanPage(),
              CollectionPage(),
              ShopPage(),
              SettingsPage(),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomBarItemWidget extends StatelessWidget {
  const BottomBarItemWidget({
    super.key,
    required this.text,
    required this.assetName,
    required this.color,
  });

  final String text;
  final String assetName;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.16.sw,
      child: Tab(
        iconMargin: EdgeInsets.only(bottom: 8.sp),
        text: text,
        icon: SvgPicture.asset(
          assetName,
          height: 26.sp,
          width: 26.sp,
          color: color,
        ),
      ),
    );
  }
}
