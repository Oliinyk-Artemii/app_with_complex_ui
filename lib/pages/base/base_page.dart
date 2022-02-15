import 'dart:ui';

import 'package:app_for_softevol/pages/hot/hot_page.dart';
import 'package:app_for_softevol/utils/navigation/project_router.dart';
import 'package:app_for_softevol/utils/values/colors.dart';
import 'package:app_for_softevol/utils/values/gen/assets.gen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

final List<String> _bottomNavigationBarTabNames = [
  'hot'.tr(),
  'discover'.tr(),
  'watch'.tr(),
  'inbox'.tr(),
  'profile'.tr(),
];

final List<Widget> _tabs = [
  const HotPage(),
  const HotPage(),
  const HotPage(),
  const HotPage(),
  const HotPage(),
];

final List<SvgGenImage> _tabIcons = [
  Assets.images.icons.hot,
  Assets.images.icons.discover,
  Assets.images.icons.watch,
  Assets.images.icons.inbox,
];

final AssetGenImage profileImage = Assets.images.profile;

class BasePage extends HookWidget {
  final int? initialPageIndex;

  const BasePage({Key? key, this.initialPageIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> currentPageIndex = useState(initialPageIndex ?? 0);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      backgroundColor: blackColor,
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
            child: IndexedStack(
              index: currentPageIndex.value,
              children: _tabs,
            ),
          ),
          _buildBottomNavigation(currentPageIndex)
        ],
      ),
    );
  }

  Widget _buildBottomNavigation(ValueNotifier<int> currentPageIndex) {
    return Align(
      alignment: FractionalOffset.bottomCenter,
      //this is very important, without it the whole screen will be blurred
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10.0,
            sigmaY: 10.0,
          ),
          child: Opacity(
            //you can change the opacity to whatever suits you best
            opacity: 0.9,
            child: BottomNavigationBar(
              backgroundColor: blackColor,
              currentIndex: currentPageIndex.value,
              onTap: (int index) {
                currentPageIndex.value = index;
              },
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: blackColor,
              items: BottomNavigationBarRoutes.values
                  .map((BottomNavigationBarRoutes route) {
                return _buildBottomNavigationBarItem(route, currentPageIndex);
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
    BottomNavigationBarRoutes route,
    ValueNotifier<int> currentPageIndex,
  ) {
    return BottomNavigationBarItem(
      activeIcon: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: -27,
            top: kBottomNavigationBarHeight,
            child: Opacity(
              opacity: 0.8,
              child: Container(
                transform: Matrix4.identity()..rotateX(1.1),
                width: 142,
                height: 142,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: const Alignment(0, 0),
                    colors: [
                      primaryColor,
                      primaryColor.withOpacity(0.0),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 60.0,
                  sigmaY: 60.0,
                ),
                child: Container(
                  color: Colors.transparent,
                )),
          ),
          Center(
            child: route.index != 4
                ? _tabIcons[route.index].svg(
                    color: primaryColor,
                  )
                : profileImage.image(),
          ),
        ],
      ),
      icon: route.index != 4
          ? _tabIcons[route.index].svg(
              color: unselectedItemColor,
            )
          : profileImage.image(),
      label: currentPageIndex.value == route.index
          ? _bottomNavigationBarTabNames[route.index]
          : '',
    );
  }
}
