import 'package:bucket_list/application/base/loadable_state.dart';
import 'package:bucket_list/domain/bucket_list/bucket_list_repository.dart';
import 'package:bucket_list/domain/bucket_list/models/bucket_list.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_bucket_list_controller.g.dart';

@riverpod
class AddBucketListController extends _$AddBucketListController {
  @override
  LoadableState<BucketList> build() {
    return const LoadableState.initial();
  }

  Future<void> addBucketList({
    required BucketList list,
  }) async {
    state = const LoadableState.loading();

    final result =
        await ref.read(bucketListRepositoryProvider).addBucketList(list).run();

    result.fold(
      LoadableState.error,
      LoadableState.success,
    );
  }
}
