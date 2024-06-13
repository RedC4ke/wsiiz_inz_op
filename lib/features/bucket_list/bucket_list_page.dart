import 'package:auto_route/auto_route.dart';
import 'package:bucket_list/core/navigation/app_router.dart';
import 'package:bucket_list/core/widgets/bl_app_bar.dart';
import 'package:bucket_list/core/widgets/bl_loading.dart';
import 'package:bucket_list/domain/bucket_list/models/bucket_list.dart';
import 'package:bucket_list/features/bucket_list/application/bucket_list_controller.dart';
import 'package:bucket_list/features/bucket_list/widgets/bucket_list_item_tile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class BucketListPage extends ConsumerWidget {
  const BucketListPage({
    required this.bucketList,
    super.key,
  });

  final BucketList bucketList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(bucketListControllerProvider(bucketList));

    return Scaffold(
      appBar: BlAppBar(
        title: bucketList.name,
        actions: [
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.circlePlus),
            onPressed: () {
              context.pushRoute(
                AddBucketListItemRoute(bucketList: bucketList),
              );
            },
          ),
        ],
      ),
      body: state.maybeWhen(
        // TODO: Implement error widget
        orElse: () => const BlLoading(),
        success: (data) {
          if (data.isEmpty) {
            return const Center(
              child: Text('No items in this list'),
            );
          }

          return ListView.separated(
            itemCount: data.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              final item = data[index];

              return BucketListItemTile(
                bucketList: bucketList,
                bucketListItem: item,
              );
            },
          );
        },
      ),
    );
  }
}
