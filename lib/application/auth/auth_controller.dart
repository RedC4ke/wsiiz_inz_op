import 'package:bucket_list/application/base/loadable_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  LoadableState<User> build() {
    return const LoadableState<User>.initial();
  }
}
