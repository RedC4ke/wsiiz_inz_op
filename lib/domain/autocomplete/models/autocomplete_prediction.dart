import 'package:bucket_list/domain/autocomplete/models/autocomplete_structured_format.dart';
import 'package:bucket_list/domain/autocomplete/models/autocomplete_substring.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'autocomplete_prediction.g.dart';

@JsonSerializable()
class AutocompletePrediction with EquatableMixin {
  AutocompletePrediction({
    required this.description,
    required this.matchedSubstrings,
    required this.structuredFormatting,
    this.placeId,
    this.types = const [],
  });

  factory AutocompletePrediction.fromJson(Map<String, dynamic> json) =>
      _$AutocompletePredictionFromJson(json);

  final String description;
  final List<AutocompleteSubstring> matchedSubstrings;
  final AutocompleteStructuredFormat structuredFormatting;
  final String? placeId;
  final List<String> types;

  @override
  List<Object?> get props => [
        description,
        matchedSubstrings,
        structuredFormatting,
        placeId,
        types,
      ];
}
