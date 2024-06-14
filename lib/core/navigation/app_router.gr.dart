// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddBucketListItemRoute.name: (routeData) {
      final args = routeData.argsAs<AddBucketListItemRouteArgs>(
          orElse: () => const AddBucketListItemRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddBucketListItemPage(
          bucketList: args.bucketList,
          key: args.key,
        ),
      );
    },
    AddBucketListRoute.name: (routeData) {
      return AutoRoutePage<BucketList>(
        routeData: routeData,
        child: const AddBucketListPage(),
      );
    },
    BucketListRoute.name: (routeData) {
      final args = routeData.argsAs<BucketListRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: BucketListPage(
          bucketList: args.bucketList,
          key: args.key,
        ),
      );
    },
    DashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardPage(),
      );
    },
    DiscoverRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DiscoverPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfilePage(),
      );
    },
    TimelineRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TimelinePage(),
      );
    },
  };
}

/// generated route for
/// [AddBucketListItemPage]
class AddBucketListItemRoute extends PageRouteInfo<AddBucketListItemRouteArgs> {
  AddBucketListItemRoute({
    BucketList? bucketList,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          AddBucketListItemRoute.name,
          args: AddBucketListItemRouteArgs(
            bucketList: bucketList,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AddBucketListItemRoute';

  static const PageInfo<AddBucketListItemRouteArgs> page =
      PageInfo<AddBucketListItemRouteArgs>(name);
}

class AddBucketListItemRouteArgs {
  const AddBucketListItemRouteArgs({
    this.bucketList,
    this.key,
  });

  final BucketList? bucketList;

  final Key? key;

  @override
  String toString() {
    return 'AddBucketListItemRouteArgs{bucketList: $bucketList, key: $key}';
  }
}

/// generated route for
/// [AddBucketListPage]
class AddBucketListRoute extends PageRouteInfo<void> {
  const AddBucketListRoute({List<PageRouteInfo>? children})
      : super(
          AddBucketListRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddBucketListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BucketListPage]
class BucketListRoute extends PageRouteInfo<BucketListRouteArgs> {
  BucketListRoute({
    required BucketList bucketList,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          BucketListRoute.name,
          args: BucketListRouteArgs(
            bucketList: bucketList,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'BucketListRoute';

  static const PageInfo<BucketListRouteArgs> page =
      PageInfo<BucketListRouteArgs>(name);
}

class BucketListRouteArgs {
  const BucketListRouteArgs({
    required this.bucketList,
    this.key,
  });

  final BucketList bucketList;

  final Key? key;

  @override
  String toString() {
    return 'BucketListRouteArgs{bucketList: $bucketList, key: $key}';
  }
}

/// generated route for
/// [DashboardPage]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DiscoverPage]
class DiscoverRoute extends PageRouteInfo<void> {
  const DiscoverRoute({List<PageRouteInfo>? children})
      : super(
          DiscoverRoute.name,
          initialChildren: children,
        );

  static const String name = 'DiscoverRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TimelinePage]
class TimelineRoute extends PageRouteInfo<void> {
  const TimelineRoute({List<PageRouteInfo>? children})
      : super(
          TimelineRoute.name,
          initialChildren: children,
        );

  static const String name = 'TimelineRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
