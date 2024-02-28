import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:postapp/product/models/user_model.dart';

part 'post_model.g.dart';

@JsonSerializable()
final class PostModel extends Equatable {
  PostModel({
    required this.id,
    required this.context,
    required this.imagePath,
    required this.senderUser,
  });

  final int id;
  final String context;
  final String imagePath;

  final UserModel senderUser;

  /// From Json constructor
  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  @override
  bool operator ==(covariant PostModel other) {
    if (identical(this, other)) return true;
    return id == other.id;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [this.id, this.context];
}
