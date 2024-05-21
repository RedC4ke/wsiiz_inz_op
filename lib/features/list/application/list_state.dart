import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:projekt/features/list/domain/models/location.dart';

part 'list_state.freezed.dart';

@freezed
class ListState with _$ListState {
  const factory ListState({
    @Default([]) List<Location> locations,
    @Default(true) bool isLoading,
  }) = _ListState;
}
