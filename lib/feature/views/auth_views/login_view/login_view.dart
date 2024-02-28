import 'dart:async';
import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postapp/feature/views/auth_views/register_view/register_view.dart';
import 'package:postapp/feature/views/posts_view/post_view.dart';
import 'package:postapp/feature/widgets/custom_button.dart';
import 'package:postapp/feature/widgets/custom_text_field.dart';
import 'package:postapp/product/constants/enums/padding_enums.dart';
import 'package:postapp/product/models/auth_user_model.dart';
import 'package:postapp/product/models/providers/auth_user_provider.dart';
import 'package:postapp/product/services/auth_service.dart';
import 'package:postapp/product/services/network_service.dart';
import 'package:postapp/product/utils/cache_util.dart';

part 'login_view_mixin.dart';
part 'login_view_cubit.dart';

class AuthLoginView extends StatefulWidget {
  const AuthLoginView({super.key});

  @override
  State<AuthLoginView> createState() => _AuthLoginViewState();
}

class _AuthLoginViewState extends State<AuthLoginView> with LoginViewOperation {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthLoginViewCubit(
        emailController: emailController,
        passwordController: passwordController,
      )..tryToLoginWithCachedAccount(),
      child: const _Scaffold(),
    );
  }
}

final class _Scaffold extends StatelessWidget {
  const _Scaffold();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthLoginViewCubit, AuthLoginState>(
      listener: (context, state) {
        if (state is AuthLoginSuccessState) {
          context.read<AuthUserProvider>().changeUser(state.model);
          Navigator.of(context).pushReplacement(
            MaterialPageRoute<void>(
              builder: (_) => const PostsView(),
            ),
          );
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: EdgeInsets.all(PaddingConstants.high.value),
          child: const Center(
            child: _Body(),
          ),
        ),
      ),
    );
  }
}

final class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final authLoginViewCubit = context.read<AuthLoginViewCubit>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextField(
          controller: authLoginViewCubit.emailController,
          hintText: 'Email',
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(
          height: 32,
        ),
        CustomTextField(
          controller: authLoginViewCubit.passwordController,
          hintText: 'Password',
        ),
        const SizedBox(
          height: 32,
        ),
        const _LoginErrorTextBuilder(),
        CustomButton(
          onTap: authLoginViewCubit.loginButtonPress,
          label: 'Login',
        ),
        const SizedBox(
          height: 64,
        ),
        RichText(
          text: TextSpan(
            text: 'Register',
            recognizer: TapGestureRecognizer()
              ..onTap = () => authLoginViewCubit.registerPageNavigate(context),
          ),
        ),
      ],
    );
  }
}

class _LoginErrorTextBuilder extends StatelessWidget {
  const _LoginErrorTextBuilder();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthLoginViewCubit, AuthLoginState>(
      builder: (context, state) {
        if (state is! AuthLoginErrorState) return const SizedBox();
        return Text(
          state.message,
          style: const TextStyle(color: Colors.red),
        );
      },
    );
  }
}
