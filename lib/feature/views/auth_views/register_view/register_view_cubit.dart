// ignore_for_file: public_member_api_docs

part of 'register_view.dart';

final class AuthRegisterViewCubit extends Cubit<AuthRegisterState> {
  AuthRegisterViewCubit({
    required this.userNameController,
    required this.emailController,
    required this.passwordController,
  }) : super(
          AuthRegisterInitialState(),
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
      password: passwordController.text,
      image: profilePicture,
    );
    if (respond == null) return;
    switch (respond.statusCode) {
      case HttpStatus.conflict:
        return emit(
          AuthRegisterErrorState(
            message: 'Email adress in on use',
          ),
        );
      case HttpStatus.ok:
        return emit(
          AuthRegisterSuccessState(
            email: emailController.text,
            password: passwordController.text,
          ),
        );
      default:
    }
  }

  void setProfilePicture(File file) {
    profilePicture = file;
  }
}

sealed class AuthRegisterState {}

final class AuthRegisterInitialState extends AuthRegisterState {}

final class AuthRegisterSuccessState extends AuthRegisterState {
  AuthRegisterSuccessState({required this.email, required this.password});

  final String email;
  final String password;
}

final class AuthRegisterErrorState extends AuthRegisterState {
  AuthRegisterErrorState({required this.message});

  final String message;
}
