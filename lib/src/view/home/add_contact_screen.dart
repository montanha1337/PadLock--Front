import 'package:brasil_fields/brasil_fields.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pix/src/controller/contact_controller.dart';
import 'package:pix/src/view/home/fetch_contacts_pix_screen.dart';
import 'package:pix/src/view/home/home_screen.dart';
import 'package:pix/src/view/shared/custom_form_widget.dart';
import 'package:pix/src/view/shared/type_pix_dropdown_widget.dart';
import 'package:pix/src/view/tabs/contacts_tab_bar_widget.dart';

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({Key? key}) : super(key: key);

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  final contactController = ContactController();

  String selected = '';
  final nameController = TextEditingController();
  final pixController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LockPix'),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.save),
          onPressed: () {
            contactController.saveContact(
              name: nameController.text,
              typePix: selected,
              pix: getPixWithoutMask(
                text: pixController.text,
                type: selected,
              ),
            );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    HomeScreen(), // redirecionar para tela de contact
              ),
            );
          }),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          children: [
            CustomFormWidget(
              inputFormatters: const [],
              controller: nameController,
              title: 'Nome do Contato',
            ),
            TypePixDropdownWidget(
              onChanged: (value) {
                setState(() {
                  selected = value.toString();
                });
              },
              selected: selected,
            ),
            CustomFormWidget(
              inputFormatters: getInputFormatter(selected),
              controller: pixController,
              title: 'Chave',
            ),
          ],
        ),
      ),
    );
  }
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
