import 'dart:convert';

import 'package:pix/src/data/dio/custom_dio.dart';
import 'package:pix/src/model/contact_model.dart';
import 'package:pix/src/model/contacts_pix_model.dart';
import 'package:pix/src/utils/storage_util.dart';

class ContactRepository {
  final dio = AppDio.getInstance();
  Future<void> saveContact({
    required String name,
    required String typePix,
    required String pix,
  }) async {
    final token = await StorageUtil.getToken();
    var params = {"nome": name, 'pix': pix, "tipo": typePix};
    dio.options.headers = {
      "Authorization": token,
    };
    try {
      await dio.post<Map<String, dynamic>>(
        'contato/inserir',
        data: jsonEncode(params),
      );
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<ContactModel>> fetchContacts() async {
    final token = await StorageUtil.getToken();
    dio.options.headers = {
      "Authorization": token,
    };
    final response = await dio.get<Map<String, dynamic>>(
      'contato/listarContato',
    );
    try {
      final List<ContactModel> list =
          (response.data!['result']['Contato'] as List)
              .map((x) => ContactModel.fromJson(x))
              .toList();
      list;
      return list;
    } catch (e) {
      return [];
    }
  }

  Future<ContactsPixModel?> fetchContactsPix({required String name}) async {
    String email = await StorageUtil.getEmail() ?? '';
    var params = {
      "contato": name,
    };
    final token = await StorageUtil.getToken();
    dio.options.headers = {
      "Authorization": token,
    };
    final response = await dio.post<Map<String, dynamic>>('contato/listarPix',
        data: jsonEncode(params));
    try {
      return ContactsPixModel.fromJson(response.data!['result']);
    } catch (e) {
      return null;
    }
  }

  Future<bool> tokenGotPermission({required String token}) async {
    var params = {
      "token": token,
    };
    final response = await dio.get<Map<String, dynamic>>(
      'desenvolvimento/testeToken',
      queryParameters: params,
    );
    try {
      if (response.data!['result']['conteudo'] != false) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<void> deletePix({required String contato, required String pix}) async {
    var params = {
      "nome": contato,
      "pix": pix,
    };
    final token = await StorageUtil.getToken();
    dio.options.headers = {
      "Authorization": token,
    };
    final response = await dio.delete<Map<String, dynamic>>(
        'contato/deletarPix',
        data: jsonEncode(params));
    try {
      response;
    } catch (e) {}
  }
}
