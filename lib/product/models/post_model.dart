import 'package:json_annotation/json_annotation.dart';
import 'package:postapp/product/models/user_model.dart';

part 'post_model.g.dart';

@JsonSerializable()
final class PostModel {
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
}
