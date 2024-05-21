import 'package:projekt/features/list/domain/models/location.dart';

abstract class ExtendedLocation implements Location {
  final Location location;

  ExtendedLocation(this.location);
}
