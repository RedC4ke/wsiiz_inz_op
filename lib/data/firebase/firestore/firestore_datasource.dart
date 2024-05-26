import 'package:bucket_list/data/firebase/firestore/firestore_deserializers.dart';
import 'package:bucket_list/domain/bucket_list/models/bucket_list_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final firestoreDatasourceProvider = Provider((ref) => FirestoreDatasource());

abstract class _Collection {
  static const users = 'users';
  static const bucketList = 'bucket_list';
}

class FirestoreDatasource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  String get _userId => _auth.currentUser!.uid;
  DocumentReference get _userDoc => _db.collection(_Collection.users).doc(
        _userId,
      );

  //* Bucket list
  Future<BucketListItem> addBucketListItem(BucketListItem item) async {
    final ref = await _userDoc.collection(_Collection.bucketList).add(
          item.toJson(),
        );

    return item.copyWith(id: ref.id);
  }

  Future<BucketListItem> updateBucketListItem(BucketListItem item) async {
    await _userDoc.collection(_Collection.bucketList).doc(item.id).update(
          item.toJson(),
        );

    return item;
  }

  Future<void> deleteBucketListItem(String id) async {
    await _userDoc.collection(_Collection.bucketList).doc(id).delete();
  }

  Future<List<BucketListItem>> getBucketList() async {
    final data = await _userDoc.collection(_Collection.bucketList).get();

    return FirestoreDeserializers.firestoreCollection(
      data,
      BucketListItem.fromJson,
    );
  }
}
