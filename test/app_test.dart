// test/app_test.dart
import 'package:bucket_list/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('App initializes correctly', () {
    const app = App();
    expect(app, isNotNull);
  });
}
