import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class TypePixDropdownWidget extends StatelessWidget {
  final type = ['email','cpf', 'cnpj', 'telefone', 'aleatoria'];

  String selected;
  void Function(String?)? onChanged;

  TypePixDropdownWidget(
      {Key? key, required this.onChanged, required this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      dropdownSearchDecoration: const InputDecoration(labelText: 'Tipo do pix'),
      items: type,
      itemAsString: (value){
        if(value == 'aleatoria'){
          return 'Chave aleatória'.toUpperCase();
        }else return value.toString().toUpperCase();
      },
      onChanged: onChanged,
    );
  }
}
