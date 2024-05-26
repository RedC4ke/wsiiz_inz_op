import 'package:bucket_list/core/config/const.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';

final googleMapsClientProvider = Provider<Dio>((ref) {
  return Dio(
    BaseOptions(
      baseUrl: Const.googleMapsURL,
    ),
  )..interceptors.addAll(
      [
        TalkerDioLogger(),
      ],
    );
});
