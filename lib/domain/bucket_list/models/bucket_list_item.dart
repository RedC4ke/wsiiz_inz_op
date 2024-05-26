import 'package:bucket_list/domain/bucket_list/models/bucket_list_item_geolocation.dart';
import 'package:bucket_list/domain/firestore/models/firestore_model.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bucket_list_item.g.dart';

@JsonSerializable()
class BucketListItem extends FirestoreModel with EquatableMixin {
  BucketListItem({
    required this.title,
    required this.description,
    required this.isCompleted,
    super.id,
    this.geolocation,
  });

  factory BucketListItem.fromJson(Map<String, dynamic> json) =>
      _$BucketListItemFromJson(json);

  final String title;
  final String description;
  final bool isCompleted;
  final BucketListItemGeolocation? geolocation;

  Map<String, dynamic> toJson() => _$BucketListItemToJson(this);

  @override
  BucketListItem copyWith({
    String? id,
    String? title,
    String? description,
    bool? isCompleted,
    BucketListItemGeolocation? geolocation,
  }) {
    return BucketListItem(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      geolocation: geolocation ?? this.geolocation,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        isCompleted,
        geolocation,
      ];
}
