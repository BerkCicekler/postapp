import 'dart:io';

import 'package:dio/dio.dart';
import 'package:postapp/product/constants/enums/endpoint_enums.dart';
import 'package:postapp/product/services/network_service.dart';
import 'package:http_parser/http_parser.dart';

/// Auth Service class for sending request to the api
final class AuthService {
  AuthService._();

  static Future<Response<dynamic>?> loginRequest({
    required String mail,
    required String password,
  }) async {
    try {
      final x = await NetworkService.instance.dio.get(
        NetworkEndPoints.user.value,
        data: {
          'mail': mail,
          'password': password,
        },
      );
      return x;
    } catch (e) {
      print(e);
    }
    return null;
  }

  static Future<Response<dynamic>?> registerRequest({
    required String name,
    required String mail,
    required String password,
    required File? image,
  }) async {
    try {
      final formData = FormData.fromMap({
        'profileImage': image != null
            ? await MultipartFile.fromFile(
                image.path,
                filename: image.path.split('/').last,
                contentType: MediaType('image', 'jpeg'),
              )
            : null,
        'name': name,
        'mail': mail,
        'password': password,
      });

      final x = await NetworkService.instance.dio.post(
        NetworkEndPoints.user.value,
        data: formData,
      );
      return x;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
