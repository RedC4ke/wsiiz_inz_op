import 'dart:ui';

import 'package:bucket_list/data/firebase/firestore/firestore_datasource.dart';
import 'package:bucket_list/domain/bucket_list/bucket_list_repository.dart';
import 'package:bucket_list/domain/bucket_list/models/bucket_list.dart';
import 'package:bucket_list/domain/bucket_list/models/bucket_list_item.dart';
import 'package:bucket_list/domain/error/models/failure.dart';
import 'package:bucket_list/gen/l10n.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFirestoreDatasource extends Mock implements FirestoreDatasource {}

void main() {
  late BucketListRepository repository;
  late MockFirestoreDatasource mockDatasource;

  setUp(() {
    S.delegate.load(const Locale('en'));
    mockDatasource = MockFirestoreDatasource();
    repository = BucketListRepository(mockDatasource);
  });

  group('BucketListRepository', () {
    final bucketList = BucketList(
      id: 'test-id',
      name: 'Test Bucket List',
      description: 'Test Description',
    );

    test('should fetch bucket list items successfully', () async {
      // Arrange
      when<Future<List<BucketListItem>>>(
        () => mockDatasource.getBucketList(bucketList.id ?? ''),
      ).thenAnswer((_) async => []);

      // Act
      final result = await repository.getBucketList(bucketList.id ?? '').run();

      // Assert
      expect(result.isRight(), true);
      expect(result.getRight().toNullable(), <BucketListItem>[]);
    });

    test('should return failure on fetch bucket list error', () async {
      // Arrange
      when<Future<List<BucketListItem>>>(
        () => mockDatasource.getBucketList(bucketList.id ?? ''),
      ).thenThrow(Exception('Failed to fetch'));

      // Act
      final result = await repository.getBucketList(bucketList.id ?? '').run();

      // Assert
      expect(result.isLeft(), true);
      expect(result.getLeft().toNullable(), isA<Failure>());
    });
  });
}
