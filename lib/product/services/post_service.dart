import 'dart:io';

import 'package:dio/dio.dart';
import 'package:postapp/product/constants/enums/endpoint_enums.dart';
import 'package:postapp/product/models/post_model.dart';
import 'package:http_parser/http_parser.dart' show MediaType;

/// Post service class for sending request to the API
final class PostService {
  /// Default constructor
  PostService({required this.dio});

  final Dio dio;

  Future<List<PostModel>> fetchPosts({required int startIndex}) async {
    final respond = await dio.get<List<dynamic>?>(
      '${NetworkEndPoints.post.value}/$startIndex',
    );
    if (respond.statusCode == HttpStatus.ok) {
      return respond.data!
          .map((post) => PostModel.fromJson(post as Map<String, dynamic>))
          .cast<PostModel>()
          .toList();
    }
    throw Exception(respond.data);
  }

  Future<bool> sendPost({
    required String context,
    required File? picture,
  }) async {
    final formData = FormData.fromMap({
      'context': context,
      'image': picture != null
          ? await MultipartFile.fromFile(
              picture.path,
              filename: picture.path.split('/').last,
              contentType: MediaType('image', 'jpeg'),
            )
          : null,
    });
    final respond = await dio.post(NetworkEndPoints.post.value, data: formData);
    return respond.statusCode == HttpStatus.ok;
  }
}
