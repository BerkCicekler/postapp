import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:postapp/feature/views/auth_views/login_view/login_view.dart';
import 'package:postapp/product/models/providers/auth_user_provider.dart';
import 'package:postapp/product/theme/dark_theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(const _MyApp());
}

final class _MyApp extends StatelessWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthUserProvider(
            authUser: null,
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Post App',
        themeMode: ThemeMode.dark,
        darkTheme: CustomDarkTheme.theme,
        home: const AuthLoginView(),
      ),
    );
  }
}
