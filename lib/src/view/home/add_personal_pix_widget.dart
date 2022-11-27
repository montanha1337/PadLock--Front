import 'package:brasil_fields/brasil_fields.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pix/src/controller/home_controller.dart';
import 'package:pix/src/controller/user_controller.dart';
import 'package:pix/src/model/bank_model.dart';
import 'package:pix/src/view/home/home_screen.dart';
import 'package:pix/src/view/shared/custom_form_widget.dart';
import 'package:pix/src/view/shared/type_pix_dropdown_widget.dart';
import 'package:pix/src/view/tabs/my_pix_tab_bar_widget.dart';

class AddPersonalPixScreen extends StatefulWidget {
  const AddPersonalPixScreen({Key? key}) : super(key: key);

  @override
  State<AddPersonalPixScreen> createState() => _AddPersonalPixScreenState();
}

class _AddPersonalPixScreenState extends State<AddPersonalPixScreen> {
  final controller = HomeController();
  final userController = UserController();

  BankModel? selectedBank = null;
  String selectedIdBank = '';
  String selectedType = '';
  final pixTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar chave'),
      ),
      body: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.save),
          onPressed: () {
            userController.savePix(
                pix: getPixWithoutMask(
                    text: pixTextEditingController.text, type: selectedType),
                idBank: selectedBank!.code!,
                typePix: selectedType);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    HomeScreen(), // redirecionar para tela de contact
              ),
            );
          },
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: FutureBuilder<List<BankModel>>(
            future: controller.fetchBanks(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    TypePixDropdownWidget(
                      onChanged: (value) {
                        setState(() {
                          selectedType = value.toString();
                        });
                      },
                      selected: selectedType,
                    ),
                    CustomFormWidget(
                      inputFormatters: getInputFormatter(selectedType),
                      controller: pixTextEditingController,
                      title: 'Chave',
                    ),
                    snapshot.data != null
                        ? DropdownSearch<BankModel>(
                            dropdownSearchDecoration:
                                const InputDecoration(labelText: 'Banco'),
                            items: snapshot.data,
                            itemAsString: (bank) => bank!.fullName,
                            onChanged: (bank) {
                              setState(() {
                                selectedBank = bank;
                              });
                            },
                            searchFieldProps: TextFieldProps(
                              controller: TextEditingController(),
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.clear),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                );
              } else if (snapshot.hasError && snapshot.error is DioError) {
                final dioError = snapshot.error as DioError;
                switch (dioError.response!.statusCode) {
                  case 400:
                    return const Center(
                      child: Text('Not found!'),
                    );
                  default:
                    return Center(
                      child: Text('Error ${dioError.message}'),
                    );
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  List<TextInputFormatter> getInputFormatter(selected) {
    switch (selected) {
      case 'cpf':
        return [
          FilteringTextInputFormatter.digitsOnly,
          CpfInputFormatter(),
        ];
      case 'cnpj':
        return [
          FilteringTextInputFormatter.digitsOnly,
          CnpjInputFormatter(),
        ];
      case 'telefone':
        return [
          FilteringTextInputFormatter.digitsOnly,
          TelefoneInputFormatter(),
        ];

      default:
        return [];
    }
  }

  String getPixWithoutMask({required String text, required String type}) {
    String result = '';
    if (type != 'email')
      result = text.replaceAll('.', '').replaceAll('-', '').replaceAll(' ', '');
    else
      result = text;
    result;
    return result;
  }
}
