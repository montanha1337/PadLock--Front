import 'package:pix/src/data/repository/user_repository.dart';
import 'package:pix/src/model/pix_model.dart';
import 'package:pix/src/model/user_model.dart';
import 'package:pix/src/utils/storage_util.dart';
import 'package:flutter/services.dart';

class UserController {
  final repository = UserRepository();

  Future<UserModel?> login({
    required String email,
    required String password,
  }) async {
    return await repository.login(
      email: email,
      password: password,
    );
  }

  Future<List<PixModel>> fetchPix() async {
    return await repository.fetchPix();
  }

  Future<void> savePix(
      {required String pix,
      required String idBank,
      required String typePix}) async {
    return await repository.savePix(pix: pix, idBank: idBank, typePix: typePix);
  }

  Future<void> deletePix({required String pix}) async {
    return await repository.deletePix(pix: pix);
  }

  Future<void> copiePix({required String pix}) async {
    Clipboard.setData(ClipboardData(text: pix));
  }

  Future<void> signup({
    required String email,
    required String name,
    required String password,
  }) async {
    return await repository.signup(
      name: name,
      email: email,
      password: password,
    );
  }

  Future<void> updatePassword({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    return await repository.updatePassword(
      email: email,
      password: password,
    );
  }

  Future<bool> tokenGotPermission({required String token}) async {
    return await repository.tokenGotPermission(token: token);
  }

  Future<void> logout() async {
    return await StorageUtil.deleteToken();
  }
}
