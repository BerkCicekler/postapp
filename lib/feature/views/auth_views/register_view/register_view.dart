import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postapp/feature/widgets/custom_button.dart';
import 'package:postapp/feature/widgets/custom_text_field.dart';
import 'package:postapp/product/constants/enums/padding_enums.dart';
import 'package:postapp/product/services/auth_service.dart';
import 'package:postapp/product/utils/image_picker_util.dart';
import 'package:postapp/product/utils/regexp_util.dart';

part 'register_view_cubit.dart';
part 'register_view_mixin.dart';

class AuthRegisterView extends StatefulWidget {
  const AuthRegisterView({super.key});

  @override
  State<AuthRegisterView> createState() => _AuthRegisterViewState();
}

class _AuthRegisterViewState extends State<AuthRegisterView>
    with RegisterViewOperation {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthRegisterViewCubit(
          userNameController: _userNameController,
          emailController: emailController,
          passwordController: passwordController),
      child: Scaffold(
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
    final authLoginViewCubit = context.read<AuthRegisterViewCubit>();
    return Column(
      children: [
        const _ProfilePicture(),
        const SizedBox(
          height: 64,
        ),
        CustomTextField(
          controller: authLoginViewCubit.userNameController,
          hintText: 'User Name',
        ),
        const SizedBox(
          height: 32,
        ),
        CustomTextField(
          controller: authLoginViewCubit.emailController,
          hintText: 'Email',
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
        CustomButton(
          onTap: authLoginViewCubit.registerButtonPress,
          label: 'Register',
        ),
      ],
    );
  }
}

final class _ProfilePicture extends StatefulWidget {
  const _ProfilePicture();

  @override
  State<_ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<_ProfilePicture> {
  Future<void> _selectImage() async {
    final image = await ImagePickerUtil.pickAnImage();
    if (image == null) return;
    context.read<AuthRegisterViewCubit>().setProfilePicture(image);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final authLoginViewCubitProfilePicture =
        context.read<AuthRegisterViewCubit>().profilePicture;
    return GestureDetector(
      onTap: _selectImage,
      child: CircleAvatar(
        radius: 70,
        backgroundColor: Colors.blue,
        child: CircleAvatar(
          radius: 64,
          backgroundColor: Colors.transparent,
          backgroundImage: authLoginViewCubitProfilePicture != null
              ? FileImage(authLoginViewCubitProfilePicture)
              : null,
          child: authLoginViewCubitProfilePicture == null
              ? const Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.white,
                  size: 55,
                )
              : null,
        ),
      ),
    );
  }
}
