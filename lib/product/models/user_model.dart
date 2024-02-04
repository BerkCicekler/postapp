import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()

/// Class for store the default information of users
class UserModel {
  /// default constructor of User model
  const UserModel({
    required this.id,
    required this.photoPath,
    required this.name,
  });

  /// User's database primary key id
  final int id;

  /// the profile picture path
  final String photoPath;

  /// User's account name
  final String name;

  /// From Json constructor
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
