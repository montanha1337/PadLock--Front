import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pix/src/controller/contact_controller.dart';
import 'package:pix/src/controller/user_controller.dart';
import 'package:pix/src/model/contact_model.dart';
import 'package:pix/src/view/home/add_contact_screen.dart';
import 'package:pix/src/view/home/fetch_contacts_pix_screen.dart';

class ContactsTabBarWidget extends StatelessWidget {
  const ContactsTabBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final controller = ContactController();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  const AddContactScreen(), // redirecionar para tela de contact
            ),
          );
        },
      ),
      body: FutureBuilder<List<ContactModel>>(
        future: controller.fetchContacts(),
        builder: (context, snapshot) {
          snapshot;
          if (snapshot.hasData) {
            snapshot.data;
            return snapshot.data != null
                ?  ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemBuilder: (context, index) {
          return ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person),
              ),
              title:  Text(
                snapshot.data![index].name,
              ),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_)=>FetchContactsPixScreen(name: snapshot.data![index].name,)));
              });
        },
        separatorBuilder: (context, index) {
          return SizedBox();
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
