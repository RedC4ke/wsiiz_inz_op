import 'package:auto_route/auto_route.dart';
import 'package:bucket_list/features/dashboard/dashboard_page.dart';
import 'package:bucket_list/features/discover/discover_page.dart';
import 'package:bucket_list/features/home/home_page.dart';
import 'package:bucket_list/features/profile/profile_page.dart';
import 'package:bucket_list/features/timeline/timeline_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.gr.dart';

final appRouterProvider = Provider((ref) => AppRouter());

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: DashboardRoute.page,
          initial: true,
          children: [
            AutoRoute(page: HomeRoute.page, initial: true),
            AutoRoute(page: DiscoverRoute.page),
            AutoRoute(page: TimelineRoute.page),
            AutoRoute(page: ProfileRoute.page),
          ],
        ),
      ];
}
