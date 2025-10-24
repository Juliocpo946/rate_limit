import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../config/app_constants.dart';

class SecureStorageService {
  final _storage = const FlutterSecureStorage();

  Future<void> saveToken(String token) async {
    await _storage.write(key: AppConstants.keyToken, value: token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: AppConstants.keyToken);
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: AppConstants.keyToken);
  }

  Future<void> saveTimeoutMinutes(int minutes) async {
    await _storage.write(key: AppConstants.keyTimeout, value: minutes.toString());
  }

  Future<int> getTimeoutMinutes() async {
    final timeoutString = await _storage.read(key: AppConstants.keyTimeout);
    if (timeoutString != null) {
      return int.tryParse(timeoutString) ?? AppConstants.defaultTimeoutMinutes;
    }
    return AppConstants.defaultTimeoutMinutes;
  }
}
