import 'package:flutter/material.dart';
import 'package:projekt/features/list/domain/models/location.dart';

class ListNotifier implements ValueNotifier<List<Location>> {
  ListNotifier(this.value);

  @override
  List<Location> value;

  final List<VoidCallback> _listeners = [];

  @override
  void addListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  @override
  void dispose() {
    _listeners.clear();
  }

  @override
  bool get hasListeners => _listeners.isNotEmpty;

  @override
  void notifyListeners() {
    for (final listener in _listeners) {
      listener();
    }
  }

  @override
  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);
  }
}
