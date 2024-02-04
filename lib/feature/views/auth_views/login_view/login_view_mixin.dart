part of 'login_view.dart';

mixin LoginViewOperation on State<AuthLoginView> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void registerPageNavigate() {}
}
