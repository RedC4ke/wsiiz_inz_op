import 'package:projekt/features/list/application/list_state.dart';
import 'package:projekt/features/list/domain/models/location.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'list_controller.g.dart';

@riverpod
class ListController extends _$ListController {
  @override
  ListState build() {
    return const ListState();
  }

  Future<void> fetchList() async {
    state = state.copyWith(isLoading: true);
    await Future.delayed(const Duration(seconds: 2));
    state = state.copyWith(
      locations: [
        Location(
          latitude: 0,
          longitude: 0,
        ),
        Location(
          latitude: 20,
          longitude: 40,
        ),
      ],
      isLoading: false,
    );
  }
}
