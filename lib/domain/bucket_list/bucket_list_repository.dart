import 'package:bucket_list/data/firebase/firestore/firestore_datasource.dart';
import 'package:bucket_list/domain/bucket_list/models/bucket_list_item.dart';
import 'package:bucket_list/domain/error/catch_error.dart';
import 'package:bucket_list/domain/error/models/failure.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

final bucketListRepositoryProvider = Provider<BucketListRepository>((ref) {
  return BucketListRepository(
    ref.read(firestoreDatasourceProvider),
  );
});

class BucketListRepository {
  BucketListRepository(this._firestore);

  final FirestoreDatasource _firestore;

  TaskEither<Failure, BucketListItem> addBucketListItem(BucketListItem item) =>
      catchError(() => _addBucketListItem(item));

  Future<BucketListItem> _addBucketListItem(BucketListItem item) {
    return _firestore.addBucketListItem(item);
  }

  TaskEither<Failure, BucketListItem> updateBucketListItem(
    BucketListItem item,
  ) =>
      catchError(() => _updateBucketListItem(item));

  Future<BucketListItem> _updateBucketListItem(BucketListItem item) {
    return _firestore.updateBucketListItem(item);
  }

  TaskEither<Failure, void> deleteBucketListItem(String id) =>
      catchError(() => _deleteBucketListItem(id));

  Future<void> _deleteBucketListItem(String id) {
    return _firestore.deleteBucketListItem(id);
  }

  TaskEither<Failure, List<BucketListItem>> getBucketList() =>
      catchError(_getBucketList);

  Future<List<BucketListItem>> _getBucketList() {
    return _firestore.getBucketList();
  }
}
