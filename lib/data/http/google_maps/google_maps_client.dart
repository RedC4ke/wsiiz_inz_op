import 'package:bucket_list/core/config/const.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';

final googleMapsClientProvider = Provider<Dio>((ref) {
  return Dio(
    BaseOptions(
      baseUrl: Const.googleMapsURL,
      headers: {
        'X-Ios-Bundle-Identifier': 'pl.wsiiz.bucketlist',
        'X-Android-Package': 'pl.wsiiz.bucketlist',
      },
    ),
  )..interceptors.addAll(
      [
        TalkerDioLogger(),
      ],
    );
});
