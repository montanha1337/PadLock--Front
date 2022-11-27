import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';

class CustomCardWidget extends StatefulWidget {
  final String title;
  final String pix;
  final String type;
  final Color color;
  final void Function()? onDelete;
  final void Function()? onCopied;
  const CustomCardWidget(
      {Key? key,
      required this.onDelete,
      required this.title,
      required this.pix,
      required this.color,
      required this.type,
      this.onCopied})
      : super(key: key);

  @override
  _CustomCardWidgetState createState() => _CustomCardWidgetState();
}

class _CustomCardWidgetState extends State<CustomCardWidget> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      iconColor: Colors.white,
      collapsedIconColor: Colors.black.withOpacity(0.2),
      backgroundColor: widget.color.withOpacity(0.4),
      collapsedBackgroundColor: widget.color,
      children: [
        Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Text(
              'Apagar Pix',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.6),
                shadows: const [
                  Shadow(
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: widget.onDelete,
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                )),
            Text(
              'Copiar Pix',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.6),
                shadows: const [
                  Shadow(
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: widget.onCopied,
                icon: Icon(
                  Icons.keyboard_double_arrow_down_rounded,
                  color: Colors.green,
                )),
          ],
        ),
        Container(
          color: Colors.white54,
          child: ListTile(
              contentPadding:
                  EdgeInsets.zero + EdgeInsets.symmetric(horizontal: 40),
              title: Text(
                'Chave:',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: _getFormattedPix(type: widget.type, pix: widget.pix)),
        ),
      ],
      title: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        width: MediaQuery.of(context).size.width,
        child: Text(
          widget.title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black.withOpacity(0.6),
            shadows: const [
              Shadow(
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getFormattedPix({required String type, required String pix}) {
    switch (type) {
      case 'cpf':
        return Text(UtilBrasilFields.obterCpf(pix));
      case 'telefone':
        return Text(pix);
      case 'cnpj':
        return Text(UtilBrasilFields.obterCnpj(pix));
      case 'aleatoria':
        return Text(pix);
      case 'email':
        return Text(pix);
        break;
      default:
        return Text('error');
    }
  }
}
