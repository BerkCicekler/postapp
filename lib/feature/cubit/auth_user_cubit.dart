// ignore_for_file: public_member_api_docs

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postapp/feature/views/posts_view/post_view.dart';
import 'package:postapp/product/constants/enums/endpoint_enums.dart';
import 'package:postapp/product/models/auth_user_model.dart';
import 'package:postapp/product/services/network_service.dart';

final class AuthUserCubit extends Cubit<AuthUserModel?> {
  AuthUserCubit() : super(null);

  Future<void> logInUser({
    required String mail,
    required String password,
    required BuildContext context,
  }) async {
    Response<dynamic>? respond = await _loginRequest(
      mail: mail,
      password: password,
    );
    if (respond == null) return;
    if (respond.statusCode == 200) {
      await Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const PostsView(),
        ),
      );
    }
  }

  Future<Response<dynamic>?> _loginRequest({
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
  }
}
