// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
      id: json['id'] as int,
      context: json['context'] as String,
      imagePath: json['imagePath'] as String,
      senderUser:
          UserModel.fromJson(json['senderUser'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'id': instance.id,
      'context': instance.context,
      'imagePath': instance.imagePath,
      'senderUser': instance.senderUser,
    };
