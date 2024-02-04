// ignore_for_file: public_member_api_docs

part of 'register_view.dart';

final class AuthRegisterViewCubit extends Cubit<RegisterState> {
  AuthRegisterViewCubit({
    required this.userNameController,
    required this.emailController,
    required this.passwordController,
  }) : super(
          RegisterInitialState(),
        );

  final TextEditingController userNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  File? profilePicture;

  Future<void> registerButtonPress() async {
    if (userNameController.text.length < 4 ||
        passwordController.text.length < 4 ||
        !RegExpUtil.email.hasMatch(emailController.text)) return;
    final respond = await AuthService.registerRequest(
      name: userNameController.text,
      mail: emailController.text,
      password: emailController.text,
      image: profilePicture,
    );
  }

  void setProfilePicture(File file) {
    profilePicture = file;
  }
}

sealed class RegisterState {}

final class RegisterInitialState extends RegisterState {}

final class RegisterSuccessState extends RegisterState {}

final class RegisterErrorState extends RegisterState {}
