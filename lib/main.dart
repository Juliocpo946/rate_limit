import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/auth_controller.dart';
import 'views/pages/login_screen.dart';
import 'views/pages/main_app_shell.dart';
import 'views/widgets/session_timer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthController()..initAuth(),
      child: MaterialApp(
        title: 'App con Timer de Sesión',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.grey[100],
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
        ),
        home: const AuthWrapper(),
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = context.watch<AuthController>();

    if (authController.isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (authController.isLoggedIn) {
      return const SessionTimer(
        child: MainAppShell(),
      );
    } else {
      return const LoginScreen();
    }
  }
}
