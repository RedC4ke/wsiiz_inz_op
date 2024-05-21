import 'package:projekt/features/list/domain/models/extended_location.dart';

class ScenicLocation extends ExtendedLocation {
  ScenicLocation(
    ExtendedLocation super.location,
    this.photos,
  );

  @override
  double get longitude => location.longitude;

  @override
  double get latitude => location.latitude;

  final List<String> photos;
}
