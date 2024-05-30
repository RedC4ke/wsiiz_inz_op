import 'package:bucket_list/application/base/loadable_state.dart';
import 'package:bucket_list/domain/auth/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  LoadableState<User> build() {
    _init();
    return const LoadableState<User>.initial();
  }

  Future<void> _init() async {
    ref.watch(authRepositoryProvider);
  }
}
