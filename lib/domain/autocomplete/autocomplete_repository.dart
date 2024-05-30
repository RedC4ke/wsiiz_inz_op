import 'dart:io';

import 'package:bucket_list/core/config/const.dart';
import 'package:bucket_list/data/http/google_maps/google_maps_datasource.dart';
import 'package:bucket_list/domain/autocomplete/models/autocomplete_response.dart';
import 'package:bucket_list/domain/error/catch_error.dart';
import 'package:bucket_list/domain/error/models/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final autocompleteRepositoryProvider = Provider<AutocompleteRepository>((ref) {
  return AutocompleteRepository(
    ref.read(googleMapsDatasourceProvider),
  );
});

class AutocompleteRepository {
  AutocompleteRepository(this._maps);

  final GoogleMapsDatasource _maps;

  TaskEither<Failure, AutocompleteResponse> getAutocomplete({
    required String input,
    required String sessionToken,
  }) =>
      catchError(
        () => _getAutocomplete(
          input: input,
          sessionToken: sessionToken,
        ),
      );

  Future<AutocompleteResponse> _getAutocomplete({
    required String input,
    required String sessionToken,
  }) async {
    late String apiKey;
    if (Platform.isAndroid) {
      apiKey = Const.googleMapsKeyAndroid;
    } else if (Platform.isIOS) {
      apiKey = Const.googleMapsKeyiOS;
    } else {
      throw Exception('Platform not supported');
    }

    final language = Intl.getCurrentLocale();

    final response = await _maps.getAutocomplete(
      input,
      language,
      sessionToken,
      apiKey,
    );

    return response;
  }
}
