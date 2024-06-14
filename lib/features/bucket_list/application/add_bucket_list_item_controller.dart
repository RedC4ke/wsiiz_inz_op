import 'package:bucket_list/application/base/loadable_state.dart';
import 'package:bucket_list/domain/bucket_list/bucket_list_repository.dart';
import 'package:bucket_list/domain/bucket_list/models/bucket_list.dart';
import 'package:bucket_list/domain/bucket_list/models/bucket_list_item.dart';
import 'package:bucket_list/features/bucket_list/application/bucket_list_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_bucket_list_item_controller.g.dart';

@riverpod
class AddBucketListItemController extends _$AddBucketListItemController {
  @override
  LoadableState<BucketListItem> build() {
    return const LoadableState.initial();
  }

  Future<void> addBucketListItem({
    required BucketListItem item,
    required BucketList? list,
  }) async {
    state = const LoadableState.loading();

    final result = await ref
        .read(bucketListRepositoryProvider)
        .addBucketListItem(item)
        .run();

    state = result.fold(
      LoadableState.error,
      (item) {
        if (list != null) {
          ref
              .read(bucketListControllerProvider(list).notifier)
              .onItemAdded(item);
        }

        return LoadableState.success(item);
      },
    );
  }
}
