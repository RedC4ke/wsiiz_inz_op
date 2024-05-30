import 'package:auto_route/auto_route.dart';
import 'package:bucket_list/core/utils/extensions.dart';
import 'package:bucket_list/core/widgets/bl_app_bar.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BlAppBar(
        title: context.s.your_list,
      ),
    );
  }
}
