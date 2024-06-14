import 'package:bucket_list/application/base/loadable_state.dart';
import 'package:bucket_list/domain/bucket_list/bucket_list_repository.dart';
import 'package:bucket_list/domain/bucket_list/models/bucket_list.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bucket_lists_controller.g.dart';

@riverpod
class BucketListsController extends _$BucketListsController {
  @override
  LoadableState<List<BucketList>> build() {
    load();
    return const LoadableState.loading();
  }

  Future<void> load() async {
    if (stateOrNull != null) state = const LoadableState.loading();

    final result =
        await ref.read(bucketListRepositoryProvider).getBucketLists().run();

    result.fold(
      (f) => state = LoadableState.error(f),
      (r) => state = LoadableState.success(r),
    );
  }

  void addListExternally(BucketList list) {
    if (stateOrNull == null) return;
    state.maybeWhen(
      orElse: () {},
      success: (data) => state = LoadableState.success([...data, list]),
    );
  }
}
