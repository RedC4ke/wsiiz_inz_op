import 'package:bucket_list/application/base/loadable_state.dart';
import 'package:bucket_list/domain/bucket_list/bucket_list_repository.dart';
import 'package:bucket_list/domain/bucket_list/models/bucket_list_item.dart';
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
  }) async {
    state = const LoadableState.loading();

    final result = await ref
        .read(bucketListRepositoryProvider)
        .addBucketListItem(item)
        .run();

    result.fold(
      LoadableState.error,
      LoadableState.success,
    );
  }
}
