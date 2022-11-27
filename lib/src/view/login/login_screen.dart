import 'package:flutter/material.dart';
import 'package:pix/src/controller/user_controller.dart';
import 'package:pix/src/utils/storage_util.dart';
import 'package:pix/src/view/home/home_screen.dart';
import 'package:pix/src/view/login/forgot_password.dart';
import 'package:pix/src/view/login/signup.dart';
import 'package:pix/src/view/shared/custom_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    final controller = UserController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                _buildAvatar(),
                const SizedBox(
                  height: 100,
                ),
                CustomFormWidget(
                  controller: emailController,
                  title: 'Email',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomFormWidget(
                  isPassword: true,
                  controller: passwordController,
                  title: 'Senha',
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () async {
                    await controller
                        .login(
                      email: emailController.text,
                      password: passwordController.text,
                    )
                        .then((value) {
                      StorageUtil.setEmail(emailController.text);
                      StorageUtil.setToken(value!.token);
                      return Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) {
                            return HomeScreen();
                          },
                        ),
                      );
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    width: MediaQuery.of(context).size.width,
                    color: Colors.green,
                    child: const Center(
                      child: Text('Logar'),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Color.fromARGB(255, 157, 157, 157),
                    ),
                    child: Text('Esqueceu sua Senha?'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              ForgotPassword(), // redirecionar para tela de contact
                        ),
                      );
                    },
                  ),
                ),
                MaterialButton(
                  color: Colors.green,
                  child: Text('Criar Conta'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            Signup(), // redirecionar para tela de contact
                      ),
                    );
                  },
                ),
              ],
            )),
      ),
    );
  }

  Widget _buildAvatar() {
    return const Align(
      alignment: Alignment.center,
      child: CircleAvatar(
        radius: 60,
        backgroundColor: Colors.green,
        child: Icon(
          Icons.people_sharp,
          size: 100,
          color: Colors.white,
        ),
      ),
    );
  }
}
