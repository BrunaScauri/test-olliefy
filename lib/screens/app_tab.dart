import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/texts.dart';

import 'package:test_olliefy/screens/map/map_screen.dart';
import 'package:test_olliefy/screens/profile/user_profile.dart';

class AppTab extends StatefulWidget {
  @override
  _AppTabState createState() => _AppTabState();
}

class _AppTabState extends State<AppTab> with TickerProviderStateMixin {
  late TabController _tabController;
  final activeIcon = ColorFilter.mode(AppColors.tabIconSelected, BlendMode.srcIn);
  final feedIconSelected = ColorFilter.mode(AppColors.primaryWhite, BlendMode.srcIn);
  final inactiveIcon = ColorFilter.mode(AppColors.primaryGray10, BlendMode.srcIn);
  
  final selectedMapIcon = SvgPicture.asset('assets/main_app/icons/map_icon_selected.svg');
  final selectedFeedIcon = SvgPicture.asset('assets/main_app/icons/feed_icon_selected.svg');
  final selectedMarketplaceIcon = SvgPicture.asset('assets/main_app/icons/marketplace_icon_selected.svg');
  final selectedProfileIcon = SvgPicture.asset('assets/main_app/icons/profile_icon_selected.svg');

  colorPicker(int index) {
    if (_tabController.index == 1){
      return feedIconSelected;
    } else{
      return inactiveIcon;
    }
  }


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryWhite,
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          body: AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            child: _buildAnimatedTabContentForIndex(_tabController.index),
          ),
          bottomNavigationBar: Container(
            color: _tabController.index == 1 ? AppColors.primaryBlack : AppColors.primaryClay5,
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(),
              unselectedLabelColor: _tabController.index == 1 ? AppColors.primaryWhite : AppColors.primaryGray10,
              labelStyle: _tabController.index == 1 ? AppBarStyles.appBarLabelSelected(color: AppColors.primaryGold60) : AppBarStyles.appBarLabelSelected(),
              unselectedLabelStyle: AppBarStyles.appBarLabel(),
              tabs: [
                Tab(text: 'Map', icon: _tabController.index == 0 ? selectedMapIcon : SvgPicture.asset('assets/main_app/icons/map_icon.svg', colorFilter: colorPicker(0))),

                Tab(text: 'Feed', icon: _tabController.index == 1 ? selectedFeedIcon : SvgPicture.asset('assets/main_app/icons/feed_icon.svg', colorFilter: inactiveIcon)),

                Tab(text: 'Create', icon: SvgPicture.asset('assets/main_app/icons/create_icon.svg', colorFilter: colorPicker(2))),

                Tab(text: 'Marketplace', icon: _tabController.index == 3 ? selectedMarketplaceIcon : SvgPicture.asset('assets/main_app/icons/marketplace_icon.svg', colorFilter: colorPicker(3))),

                Tab(text: 'Profile', icon: _tabController.index == 4 ? selectedProfileIcon : SvgPicture.asset('assets/main_app/icons/profile_icon.svg', colorFilter: colorPicker(4))),
              ],
            ),
          )
        ),
      )
    );
  }

  Widget _buildAnimatedTabContentForIndex(int index) {
    switch (index) {
      case 0:
        return Container(key: ValueKey<int>(0), child: MapScreen());
      case 1:
        return Container(key: ValueKey<int>(1), child: Icon(Icons.directions_transit));
      case 2:
        return Container(key: ValueKey<int>(2), child: Icon(Icons.directions_bike));
      case 3:
        return Container(key: ValueKey<int>(3), child: Icon(Icons.directions_bike));
      case 4:
        return Container(key: ValueKey<int>(4), child: UserProfile());
      default:
        return Container();
    }
  }
}
