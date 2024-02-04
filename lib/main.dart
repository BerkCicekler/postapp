import 'package:flutter/material.dart';
import 'package:postapp/feature/views/auth_views/login_view/login_view.dart';
import 'package:postapp/product/theme/dark_theme.dart';

void main() => runApp(const _MyApp());

final class _MyApp extends StatelessWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Post App',
      themeMode: ThemeMode.dark,
      darkTheme: CustomDarkTheme.theme,
      home: const AuthLoginView(),
    );
  }
}
