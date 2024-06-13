import 'package:bucket_list/application/base/loadable_state.dart';
import 'package:bucket_list/domain/bucket_list/bucket_list_repository.dart';
import 'package:bucket_list/domain/bucket_list/models/bucket_list.dart';
import 'package:bucket_list/domain/bucket_list/models/bucket_list_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bucket_list_controller.g.dart';

@riverpod
class BucketListController extends _$BucketListController {
  @override
  LoadableState<List<BucketListItem>> build(BucketList list) {
    return const LoadableState.loading();
  }

  Future<void> toggleCompletion(BucketListItem item) async {
    state = const LoadableState.loading();

    final result = await ref
        .read(bucketListRepositoryProvider)
        .updateBucketListItem(item.copyWith(isCompleted: !item.isCompleted))
        .run();

    state = result.fold(
      LoadableState.error,
      (i) {},
    );
  }
}
