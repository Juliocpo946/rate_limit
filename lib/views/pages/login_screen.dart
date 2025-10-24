import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/auth_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _userController = TextEditingController(text: 'usuario');
  final _passController = TextEditingController(text: '12345');
  final _formKey = GlobalKey<FormState>();

  void _performLogin() {
    if (_formKey.currentState!.validate()) {
      final authController = Provider.of<AuthController>(context, listen: false);
      authController.login(_userController.text, _passController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoginLoading = context.watch<AuthController>().isLoginLoading;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Iniciar Sesión',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      controller: _userController,
                      decoration: const InputDecoration(
                        labelText: 'Usuario',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: (v) => v!.isEmpty ? 'Requerido' : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _passController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Contraseña',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                      ),
                      validator: (v) => v!.isEmpty ? 'Requerido' : null,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: isLoginLoading ? null : _performLogin,
                      child: isLoginLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text('Ingresar'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
