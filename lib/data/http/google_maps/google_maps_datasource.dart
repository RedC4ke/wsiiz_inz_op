import 'package:bucket_list/data/http/google_maps/google_maps_client.dart';
import 'package:bucket_list/domain/autocomplete/models/autocomplete_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

part 'google_maps_datasource.g.dart';

final googleMapsDatasourceProvider = Provider<GoogleMapsDatasource>((ref) {
  return GoogleMapsDatasource(ref.read(googleMapsClientProvider));
});

@RestApi()
abstract class GoogleMapsDatasource {
  factory GoogleMapsDatasource(Dio dio) = _GoogleMapsDatasource;

  @GET('/place/autocomplete/json')
  Future<AutocompleteResponse> getAutocomplete(
    @Query('input') String input,
    @Query('language') String language,
    @Query('sessiontoken') String sessionToken,
    @Query('key') String key,
  );

  @GET('/place/details/json')
  Future<String> getPlaceDetails(
    @Query('place_id') String placeId,
    @Query('key') String key,
  );
}
