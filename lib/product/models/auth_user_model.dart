import 'package:json_annotation/json_annotation.dart';
import 'package:postapp/product/models/user_model.dart';

part 'auth_user_model.g.dart';

/// The model created for only store the data of current user's account
@JsonSerializable()
final class AuthUserModel extends UserModel {
  /// Default constructor
  const AuthUserModel({
    required super.id,
    required this.mail,
    required this.authToken,
    required super.photoPath,
    required super.name,
  });

  /// From Json constructor
  factory AuthUserModel.fromJson(Map<String, dynamic> json) =>
      _$AuthUserModelFromJson(json);

  /// mail address of the user
  final String mail;

  /// authToken required for some http requests
  final String authToken;

  Map<String, dynamic> toJson() => _$AuthUserModelToJson(this);
}
