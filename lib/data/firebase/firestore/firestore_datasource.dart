import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final firestoreDatasourceProvider = Provider((ref) => FirestoreDatasource());

class FirestoreDatasource {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
}
