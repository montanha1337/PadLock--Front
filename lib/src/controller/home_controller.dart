import 'package:pix/src/data/repository/bank_repository.dart';
import 'package:pix/src/model/bank_model.dart';

class HomeController {
  final repository = BankRepository();

  Future<List<BankModel>> fetchBanks() async {
    return await repository.fetchBanks();
  }
}
