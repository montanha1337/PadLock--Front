import 'dart:convert';
import "package:collection/collection.dart";
import 'package:pix/src/data/dio/custom_dio.dart';
import 'package:pix/src/model/pix_model.dart';
import 'package:pix/src/model/user_model.dart';
import 'package:pix/src/utils/storage_util.dart';

class UserRepository {
  final dio = AppDio.getInstance();
  Future<UserModel?> login(
      {required String email, required String password}) async {
    var params = {
      "email": email,
      'senha': password,
    };
    final response = await dio.post<Map<String, dynamic>>('user/login',
        data: jsonEncode(params));
    try {
      return UserModel.fromJson(response.data!['result']);
    } catch (e) {
      return null;
    }
  }

  Future<List<PixModel>> fetchPix() async {
    String email = await StorageUtil.getEmail() ?? '';
    var params = {
      "email": email,
    };
    final token = await StorageUtil.getToken();
    dio.options.headers = {
      "Authorization": token,
    };
    final response = await dio.post<Map<String, dynamic>>('pix/listar',
        data: jsonEncode(params));
    try {
      return (response.data!['result']['pix'] as List)
          .map((x) => PixModel.fromJson(x))
          .toList();
    } catch (e) {
      return [];
    }
  }

  Future<void> savePix(
      {required String pix,
      required String idBank,
      required String typePix}) async {
    String email = await StorageUtil.getEmail() ?? '';
    var params = {
      "email": email,
      "pix": pix,
      "idBanco": idBank,
      "tipo": typePix,
    };
    final token = await StorageUtil.getToken();
    dio.options.headers = {
      "Authorization": token,
    };
    final response = await dio.post<Map<String, dynamic>>('pix/inserir',
        data: jsonEncode(params));
    try {
      response;
    } catch (e) {}
  }

  Future<void> deletePix({required String pix}) async {
    String email = await StorageUtil.getEmail() ?? '';
    var params = {
      "email": email,
      "pix": pix,
    };
    final token = await StorageUtil.getToken();
    dio.options.headers = {
      "Authorization": token,
    };
    final response = await dio.delete<Map<String, dynamic>>('pix/deletar',
        data: jsonEncode(params));
    try {
      response;
    } catch (e) {}
  }

  Future<void> signup({
    required String email,
    required String name,
    required String password,
  }) async {
    var params = {
      "nome": name,
      "email": email,
      "senha": password,
    };

    try {
      await dio.post<Map<String, dynamic>>('user/cadastro',
          data: jsonEncode(params));
    } catch (e) {
      return null;
    }
  }

  Future<void> updatePassword({
    required String email,
    required String password,
  }) async {
    var params = {
      "email": email,
      "senha": password,
      "antiga": "",
    };

    try {
      await dio.put<Map<String, dynamic>>('user/alteraSenha',
          data: jsonEncode(params));
    } catch (e) {
      return null;
    }
  }

  Future<bool> tokenGotPermission({required String token}) async {
    var params = {
      "token": token,
    };
    bool result = false;
    final response = await dio.post<Map<String, dynamic>>(
      'user/atualizaToken',
      data: json.encode(params),
    );
    try {
      await StorageUtil.setToken(response.data!['result']);
      result = true;
    } catch (e) {
      result = false;
    }
    return result;
  }
}
