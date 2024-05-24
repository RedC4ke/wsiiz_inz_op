import 'package:bucket_list/gen/l10n.dart';

sealed class Failure {
  String get message;
}

class UnexpectedFailure extends Failure {
  @override
  String get message => S.current.err_unknown;
}
