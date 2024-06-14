import 'package:auto_route/auto_route.dart';
import 'package:bucket_list/core/navigation/app_router.dart';
import 'package:bucket_list/core/theme/bl_ui_util.dart';
import 'package:bucket_list/features/dashboard/widgets/bl_bottom_app_bar.dart';
import 'package:bucket_list/features/dashboard/widgets/bl_fab.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  static const _routes = [
    HomeRoute(),
    DiscoverRoute(),
    TimelineRoute(),
    ProfileRoute(),
  ];

  static const items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
        color: Colors.transparent,
      ),
      label: 'stub',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: _routes,
      floatingActionButton: const BlFab(),
      floatingActionButtonLocation: const CenteredBeveledFABLocation(),
      extendBody: true,
      bottomNavigationBuilder: (_, tabsRouter) {
        return BlBottomAppBar(router: tabsRouter);
      },
    );
  }
}
