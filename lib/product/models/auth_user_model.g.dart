// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthUserModel _$AuthUserModelFromJson(Map<String, dynamic> json) =>
    AuthUserModel(
      id: json['id'] as int,
      mail: json['mail'] as String,
      authToken: json['authToken'] as String,
      photoPath: json['photoPath'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$AuthUserModelToJson(AuthUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'photoPath': instance.photoPath,
      'name': instance.name,
      'mail': instance.mail,
      'authToken': instance.authToken,
    };
