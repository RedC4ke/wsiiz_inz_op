import 'dart:async';

import 'package:bucket_list/domain/error/models/failure.dart';
import 'package:fpdart/fpdart.dart';

TaskEither<Failure, T> catchError<T>(Future<T> Function() f) {
  return TaskEither.tryCatch(
    f,
    (e, s) {
      return UnexpectedFailure();
    },
  );
}
