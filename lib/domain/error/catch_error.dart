import 'dart:async';
import 'dart:developer';

import 'package:bucket_list/domain/error/models/failure.dart';
import 'package:fpdart/fpdart.dart';

TaskEither<Failure, T> catchError<T>(Future<T> Function() f) {
  return TaskEither.tryCatch(
    f,
    (e, s) {
      final failure = UnexpectedFailure(
        exception: e is Exception ? e : Exception(e.toString()),
        stackTrace: s,
      );

      log(
        'Error: ${failure.message}',
        error: failure.exception,
        stackTrace: failure.stackTrace,
      );

      return failure;
    },
  );
}
