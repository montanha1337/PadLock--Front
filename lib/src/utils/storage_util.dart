import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageUtil {
  static FlutterSecureStorage storage = const FlutterSecureStorage();

  static Future<String?> getToken() async {
    return storage.read(key: 'token');
  }

  static Future<void> setToken(String value) async {
    return storage.write(key: 'token', value: value);
  }
  static Future<void> setEmail(String value) async {
    return storage.write(key: 'email', value: value);
  }
   static Future<String?> getEmail() async {
    return storage.read(key: 'email');
  }
     static Future<void> deleteEmail() async {
    return storage.delete(key: 'email');
  }
  static Future<void> deleteToken() async {
    return storage.delete(key: 'token');
  }
}
