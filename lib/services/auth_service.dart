class AuthService {
  Future<String> login(String username, String password) async {
    await Future.delayed(const Duration(seconds: 1));

    if (username == 'usuario' && password == '12345') {
      return "jwt-token-valido-${DateTime.now().millisecondsSinceEpoch}";
    } else {
      throw Exception('Credenciales incorrectas');
    }
  }

  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 500));
    print("Token invalidado en el backend (simulado).");
  }
}
