import 'package:flutter/material.dart';
import 'package:pix/src/controller/user_controller.dart';
import 'package:pix/src/view/home/add_contact_screen.dart';
import 'package:pix/src/view/home/add_personal_pix_widget.dart';
import 'package:pix/src/view/login/login_screen.dart';
import 'package:pix/src/view/shared/expandable_FAB_widget.dart';
import 'package:pix/src/view/shared/touchable_opacity_widget.dart';
import 'package:pix/src/view/tabs/contacts_tab_bar_widget.dart';
import 'package:pix/src/view/tabs/my_pix_tab_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  final controller = UserController();
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Lock Pix'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Meus pix'),
              Tab(text: 'Contatos'),
            ],
          ),
          actions: [
            PopupMenuButton(
              icon: const Icon(
                  Icons.more_horiz), //don't specify icon if you want 3 dot menu
              color: Colors.green,
              itemBuilder: (context) => [
                const PopupMenuItem<int>(
                  value: 0,
                  child: Text(
                    "Logout",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
              onSelected: (item) {
                controller.logout().whenComplete(() =>
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const LoginScreen())));
              },
            ),
          ],
        ),
        body:  TabBarView(
          children: [
            MyPixTabBarWidget(),
            ContactsTabBarWidget(),
          ],
        ),
      ),
    );
  }
}
