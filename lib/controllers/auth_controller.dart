import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../services/secure_storage_service.dart';
import '../config/app_constants.dart';

class AuthController extends ChangeNotifier {
  final AuthService _authService = AuthService();
  final SecureStorageService _storageService = SecureStorageService();

  bool _isLoggedIn = false;
  bool _isLoading = true;
  bool _isLoginLoading = false;

  bool get isLoggedIn => _isLoggedIn;
  bool get isLoading => _isLoading;
  bool get isLoginLoading => _isLoginLoading;

  Future<void> initAuth() async {
    final token = await _storageService.getToken();
    _isLoggedIn = token != null;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> login(String username, String password) async {
    _isLoginLoading = true;
    notifyListeners();
    try {
      final token = await _authService.login(username, password);
      // Guarda el token
      await _storageService.saveToken(token);
      // Guarda la variable de tiempo 'X'
      await _storageService.saveTimeoutMinutes(AppConstants.defaultTimeoutMinutes);

      _isLoggedIn = true;
    } catch (e) {
      print("Error en login: $e");
    }
    _isLoginLoading = false;
    notifyListeners();
  }

  Future<void> logout() async {
    await _authService.logout();
    await _storageService.deleteToken();
    _isLoggedIn = false;
    notifyListeners();
    print("Sesión cerrada.");
  }
}

