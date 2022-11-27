import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pix/src/controller/user_controller.dart';
import 'package:pix/src/model/pix_model.dart';
import 'package:pix/src/view/home/add_personal_pix_widget.dart';
import 'package:pix/src/view/shared/custom_card_widget.dart';

class MyPixTabBarWidget extends StatefulWidget {
  MyPixTabBarWidget({Key? key}) : super(key: key);

  @override
  State<MyPixTabBarWidget> createState() => _MyPixTabBarWidgetState();
}

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

class _MyPixTabBarWidgetState extends State<MyPixTabBarWidget> {
  final controller = UserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  const AddPersonalPixScreen(), // redirecionar para tela de contact
            ),
          );
        },
      ),
      body: FutureBuilder<List<PixModel>>(
        future: controller.fetchPix(),
        builder: (context, snapshot) {
          snapshot;
          if (snapshot.hasData) {
            snapshot.data;
            return snapshot.data != null
                ? ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemBuilder: (context, index) {
                      final bankName = snapshot.data![index].bankName;
                      return CustomCardWidget(
                        onDelete: () {
                          controller.deletePix(pix: snapshot.data![index].pix);
                          showSuccessMessage(context, "Excluído com sucesso");
                        },
                        title: bankName.toString().toUpperCase(),
                        type: snapshot.data![index].type,
                        pix: snapshot.data![index].pix,
                        color: Colors.green,
                        onCopied: () {
                          controller.copiePix(pix: snapshot.data![index].pix);
                          showSuccessMessage(context, "Copiado com sucesso");
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: snapshot.data!.length,
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
    );
  }
}
