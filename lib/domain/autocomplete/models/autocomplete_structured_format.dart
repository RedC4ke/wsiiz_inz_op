import 'package:bucket_list/domain/autocomplete/models/autocomplete_substring.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'autocomplete_structured_format.g.dart';

@JsonSerializable()
class AutocompleteStructuredFormat with EquatableMixin {
  AutocompleteStructuredFormat({
    required this.mainText,
    required this.mainTextMatchedSubstrings,
    this.secondaryText,
    this.secondaryTextMatchedSubstrings = const [],
  });

  factory AutocompleteStructuredFormat.fromJson(Map<String, dynamic> json) =>
      _$AutocompleteStructuredFormatFromJson(json);

  final String mainText;
  final List<AutocompleteSubstring> mainTextMatchedSubstrings;
  final String? secondaryText;
  final List<AutocompleteSubstring> secondaryTextMatchedSubstrings;

  @override
  List<Object?> get props => [
        mainText,
        secondaryText,
        mainTextMatchedSubstrings,
        secondaryTextMatchedSubstrings,
      ];
}
