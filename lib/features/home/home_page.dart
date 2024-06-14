import 'package:auto_route/auto_route.dart';
import 'package:bucket_list/core/utils/extensions.dart';
import 'package:bucket_list/core/widgets/bl_app_bar.dart';
import 'package:bucket_list/core/widgets/bl_loading.dart';
import 'package:bucket_list/features/home/application/bucket_lists_controller.dart';
import 'package:bucket_list/features/home/widgets/bucket_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(bucketListsControllerProvider);

    return Scaffold(
      appBar: BlAppBar(
        title: context.s.your_list,
      ),
      body: state.maybeWhen(
        success: (data) {
          return GridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            padding: const EdgeInsets.all(24),
            children: data.map((e) => BucketListTile(bucketList: e)).toList(),
          );
        },
        orElse: () => const BlLoading(),
      ),
    );
  }
}
