import 'package:bucket_list/application/auth/auth_controller.dart';
import 'package:bucket_list/core/navigation/app_router.dart';
import 'package:bucket_list/core/theme/bl_theme.dart';
import 'package:bucket_list/gen/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);
    ref.watch(authControllerProvider);

    return MaterialApp.router(
      theme: BlTheme.light,
      routerConfig: appRouter.config(),
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
