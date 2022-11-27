import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormWidget extends StatelessWidget {
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  final String title;
  final bool? isPassword;

  const CustomFormWidget({
    Key? key,
    required this.controller,
    required this.title,
    this.inputFormatters,
    this.isPassword,
    style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(hintText: title),
      obscureText: isPassword ?? false,
    );
  }
}
