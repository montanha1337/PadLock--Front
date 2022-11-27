import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pix/src/controller/contact_controller.dart';
import 'package:pix/src/model/contacts_pix_model.dart';
import 'package:pix/src/view/shared/custom_card_widget.dart';
import 'package:flutter/services.dart';

class FetchContactsPixScreen extends StatelessWidget {
  final String name;
  FetchContactsPixScreen({Key? key, required this.name}) : super(key: key);
  final controller = ContactController();

  void showSuccessMessage(BuildContext context, String msg) async {
    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(msg),
        actions: <Widget>[
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text("Ok"))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: FutureBuilder<ContactsPixModel?>(
          future: controller.fetchContactsPix(name: name),
          builder: (context, snapshot) {
            snapshot;
            if (snapshot.hasData) {
              snapshot.data;
              return snapshot.data != null
                  ? ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemBuilder: (context, index) {
                        return CustomCardWidget(
                          onDelete: () {
                            controller.deletePix(
                                contato: name,
                                pix: snapshot.data!.listOfPix[index].pix);
                            showSuccessMessage(context, "Excluído com sucesso");
                          },
                          title: snapshot.data!.listOfPix[index].type
                              .toUpperCase(),
                          type: snapshot.data!.listOfPix[index].type,
                          pix: snapshot.data!.listOfPix[index].pix,
                          color: Colors.green,
                          onCopied: () {
                            controller.copiePix(
                                pix: snapshot.data!.listOfPix[index].pix);
                            showSuccessMessage(context, "Copiado com sucesso");
                          },
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 10);
                      },
                      itemCount: snapshot.data!.listOfPix.length,
                    )
                  : const SizedBox.shrink();
            } else if (snapshot.hasError && snapshot.error is DioError) {
              final dioError = snapshot.error as DioError;
              switch (dioError.response!.statusCode) {
                case 404:
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
    );
  }
}
