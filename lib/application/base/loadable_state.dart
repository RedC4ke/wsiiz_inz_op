import 'package:bucket_list/domain/error/models/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'loadable_state.freezed.dart';

@freezed
class LoadableState<T> with _$LoadableState<T> {
  const factory LoadableState.initial() = _Initial<T>;
  const factory LoadableState.loading() = _Loading<T>;
  const factory LoadableState.success(T data) = _Success<T>;
  const factory LoadableState.error(Failure failure) = _Error<T>;
}
