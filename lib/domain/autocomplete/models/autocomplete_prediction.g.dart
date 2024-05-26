// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autocomplete_prediction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AutocompletePrediction _$AutocompletePredictionFromJson(
        Map<String, dynamic> json) =>
    AutocompletePrediction(
      description: json['description'] as String,
      matchedSubstrings: (json['matchedSubstrings'] as List<dynamic>)
          .map((e) => AutocompleteSubstring.fromJson(e as Map<String, dynamic>))
          .toList(),
      structuredFormatting: AutocompleteStructuredFormat.fromJson(
          json['structuredFormatting'] as Map<String, dynamic>),
      placeId: json['placeId'] as String?,
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
    );

Map<String, dynamic> _$AutocompletePredictionToJson(
        AutocompletePrediction instance) =>
    <String, dynamic>{
      'description': instance.description,
      'matchedSubstrings': instance.matchedSubstrings,
      'structuredFormatting': instance.structuredFormatting,
      'placeId': instance.placeId,
      'types': instance.types,
    };
