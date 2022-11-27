import 'package:pix/src/data/dio/custom_dio.dart';
import 'package:pix/src/model/bank_model.dart';

class BankRepository {
  final dio = AppDio.getInstance();
  Future<List<BankModel>> fetchBanks() async {
    final response = await dio.get<Map<String, dynamic>>('banco/listar');
    try {
      final results = response.data!['result']
          .map<BankModel>((e) => BankModel.fromJson(e))
          .toList();

      return results;
    } catch (e) {
      return [
        //Todo: add exception
      ];
    }
  }
}
