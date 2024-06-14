import 'dart:ui';

import 'package:bucket_list/data/firebase/auth/firebase_auth_datasource.dart';
import 'package:bucket_list/domain/auth/auth_repository.dart';
import 'package:bucket_list/domain/error/models/failure.dart';
import 'package:bucket_list/gen/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rxdart/subjects.dart';

class MockFirebaseAuthDatasource extends Mock
    implements FirebaseAuthDatasource {}

class MockUser extends Mock implements User {}

void main() {
  late AuthRepository repository;
  late MockFirebaseAuthDatasource mockFirebaseAuthDatasource;
  late BehaviorSubject<User?> authStateChangesSubject;

  setUp(() {
    S.delegate.load(const Locale('en'));

    mockFirebaseAuthDatasource = MockFirebaseAuthDatasource();
    repository = AuthRepository(mockFirebaseAuthDatasource);
    authStateChangesSubject = BehaviorSubject<User?>();
    when<Stream<User?>>(() => mockFirebaseAuthDatasource.authStateChanges)
        .thenAnswer((_) => authStateChangesSubject.stream);
  });

  group('AuthRepository', () {
    test(
        'should initialize with anonymous sign-in and listen to auth state changes',
        () async {
      // Arrange
      final user = MockUser();
      when<Future<User?>>(mockFirebaseAuthDatasource.signInAnonymously)
          .thenAnswer((_) async => user);

      // Act
      await repository.signInAnonymously().run();

      // Assert
      verify<Future<User?>>(mockFirebaseAuthDatasource.signInAnonymously)
          .called(2);
      await expectLater(
        repository.userStream,
        emitsInOrder([Right<Failure, User>(user)]),
      );
    });

    test('should handle errors during anonymous sign-in', () async {
      // Arrange
      when<Future<User?>>(mockFirebaseAuthDatasource.signInAnonymously)
          .thenThrow(Exception('Sign-in failed'));

      // Act
      final result = await repository.signInAnonymously().run();

      // Assert
      expect(result.isLeft(), true);
      expect(result.getLeft().toNullable(), isA<Failure>());
    });

    test('should sign out the user', () async {
      // Arrange
      when<void>(mockFirebaseAuthDatasource.signOut).thenAnswer((_) async {});

      // Act
      final result = await repository.signOut().run();

      // Assert
      expect(result.isRight(), true);
      verify<void>(mockFirebaseAuthDatasource.signOut).called(1);
    });
  });
}
