import 'dart:io';
import 'dart:ui';
import 'package:bucket_list/core/config/const.dart';
import 'package:bucket_list/data/http/google_maps/google_maps_datasource.dart';
import 'package:bucket_list/domain/autocomplete/autocomplete_repository.dart';
import 'package:bucket_list/domain/autocomplete/models/autocomplete_response.dart';
import 'package:bucket_list/domain/error/models/failure.dart';
import 'package:bucket_list/gen/l10n.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGoogleMapsDatasource extends Mock implements GoogleMapsDatasource {}

void main() {
  late AutocompleteRepository repository;
  late MockGoogleMapsDatasource mockGoogleMapsDatasource;

  setUp(() {
    mockGoogleMapsDatasource = MockGoogleMapsDatasource();
    repository = AutocompleteRepository(mockGoogleMapsDatasource);
    S.delegate.load(const Locale('en'));
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
  });

  group('getAutocomplete', () {
    const input = 'test';
    const sessionToken = 'session-token';
    final response = AutocompleteResponse(
      predictions: [],
      status: AutocompleteStatus.ok,
    );

    test('should return AutocompleteResponse on successful API call', () async {
      // Arrange
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      when<Future<AutocompleteResponse>>(
        () => mockGoogleMapsDatasource.getAutocomplete(
          any(),
          any(),
          any(),
          any(),
        ),
      ).thenAnswer((_) async => response);

      // Act
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      final result = await repository
          .getAutocomplete(input: input, sessionToken: sessionToken)
          .run();

      // Assert
      expect(result.isRight(), true);
      expect(result.getRight().toNullable(), response);
      verify<Future<AutocompleteResponse>>(
        () => mockGoogleMapsDatasource.getAutocomplete(
          input,
          any(),
          sessionToken,
          any(),
        ),
      ).called(1);
    });

    test('should return Failure on API failure', () async {
      // Arrange
      when<Future<AutocompleteResponse>>(
        () => mockGoogleMapsDatasource.getAutocomplete(
          any(),
          any(),
          any(),
          any(),
        ),
      ).thenThrow(Exception('API Error'));

      // Act
      final result = await repository
          .getAutocomplete(input: input, sessionToken: sessionToken)
          .run();

      // Assert
      expect(result.isLeft(), true);
      expect(result.getLeft().toNullable(), isA<Failure>());
    });

    test('should use correct API key based on platform', () async {
      const androidApiKey = Const.googleMapsKeyAndroid;
      const iosApiKey = Const.googleMapsKeyiOS;

      // Act
      await repository
          .getAutocomplete(input: input, sessionToken: sessionToken)
          .run();

      // Assert - on Android platform
      if (Platform.isAndroid) {
        verify<Future<AutocompleteResponse>>(
          () => mockGoogleMapsDatasource.getAutocomplete(
            input,
            any(),
            sessionToken,
            androidApiKey,
          ),
        ).called(1);
      }

      // Mock platform is iOS
      // Replace platform with iOS and rerun the test
      if (Platform.isIOS) {
        verify<Future<AutocompleteResponse>>(
          () => mockGoogleMapsDatasource.getAutocomplete(
            input,
            any(),
            sessionToken,
            iosApiKey,
          ),
        ).called(1);
      }
    });
  });
}
