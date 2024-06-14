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
    loadItems();
    return const LoadableState.loading();
  }

  Future<void> loadItems() async {
    if (stateOrNull != null) state = const LoadableState.loading();

    final result = await ref
        .read(bucketListRepositoryProvider)
        .getBucketList(list.id ?? '')
        .run();

    state = result.fold(
      LoadableState.error,
      LoadableState.success,
    );
  }

  Future<void> toggleCompletion(BucketListItem item) async {
    final result = await ref
        .read(bucketListRepositoryProvider)
        .updateBucketListItem(item.copyWith(isCompleted: !item.isCompleted))
        .run();

    state = result.fold(
      LoadableState.error,
      (i) {
        final items = state.maybeWhen(
          orElse: () => <BucketListItem>[],
          success: (data) => data,
        );

        final index = items.indexWhere((element) => element.id == i.id);
        if (index == -1) return state;

        final newItems = List<BucketListItem>.from(items);
        newItems[index] = i;

        return LoadableState.success(newItems);
      },
    );
  }

  void onItemAdded(BucketListItem item) {
    final items = state.maybeWhen(
      orElse: () => <BucketListItem>[],
      success: (data) => data,
    );

    state = LoadableState.success([...items, item]);
  }
}
