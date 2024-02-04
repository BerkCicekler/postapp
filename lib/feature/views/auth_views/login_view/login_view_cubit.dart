// ignore_for_file: public_member_api_docs

part of 'login_view.dart';

final class AuthLoginViewCubit extends Cubit<AuthLoginState> {
  AuthLoginViewCubit({
    required this.emailController,
    required this.passwordController,
  }) : super(AuthLoginStateInitialState());

  final TextEditingController emailController;
  final TextEditingController passwordController;

  Future<void> loginButtonPress() async {
    final respond = await AuthService.loginRequest(
      mail: emailController.text,
      password: passwordController.text,
    );
    if (respond == null) {
      return;
    }
    switch (respond.statusCode) {
      case HttpStatus.ok:
        emit(
          AuthLoginSuccessState(
            model: AuthUserModel.fromJson(
              respond.data as Map<String, dynamic>,
            ),
          ),
        );
      case HttpStatus.unauthorized:
        emit(
          AuthLoginErrorState(
            message: 'Email or password is incorrect',
          ),
        );
      default:
    }
  }
}

sealed class AuthLoginState {}

final class AuthLoginStateInitialState extends AuthLoginState {}

final class AuthLoginSuccessState extends AuthLoginState {
  AuthLoginSuccessState({required this.model});

  final AuthUserModel model;
}

final class AuthLoginErrorState extends AuthLoginState {
  AuthLoginErrorState({required this.message});

  final String message;
}
