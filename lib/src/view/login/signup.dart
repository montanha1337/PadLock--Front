import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pix/src/controller/user_controller.dart';
import 'package:pix/src/view/login/Login_screen.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final controller = UserController();
  final nameTextEditingController = TextEditingController();
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final confirmPasswordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Color.fromARGB(255, 43, 27, 97), Colors.green])),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Crie sua conta'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: height * 0.20,
                ),
                Container(
                  margin: EdgeInsets.only(top: height * 0.15),
                  height: height * 0.85,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(top: 50),
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: width * 0.05),
                          child: TextField(
                            controller: nameTextEditingController,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: "Seu nome * ",
                              hintStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.8),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    width: 1,
                                    style: BorderStyle.solid,
                                    color: Colors.green),
                              ),
                              filled: true,
                              fillColor: Colors.grey[200],
                              contentPadding: const EdgeInsets.all(12),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    width: 1,
                                    style: BorderStyle.solid,
                                    color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.04,
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: width * 0.05),
                          child: TextField(
                            controller: emailTextEditingController,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: "Seu e-mail * ",
                              hintStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.8),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    width: 1,
                                    style: BorderStyle.solid,
                                    color: Colors.green),
                              ),
                              filled: true,
                              fillColor: Colors.grey[200],
                              contentPadding: const EdgeInsets.all(12),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    width: 1,
                                    style: BorderStyle.solid,
                                    color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.04,
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: width * 0.05),
                          child: TextField(
                              controller: passwordTextEditingController,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: "Informe uma Senha * ",
                                hintStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.8),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      width: 1,
                                      style: BorderStyle.solid,
                                      color: Colors.green),
                                ),
                                filled: true,
                                fillColor: Colors.grey[200],
                                contentPadding: const EdgeInsets.all(12),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      width: 1,
                                      style: BorderStyle.solid,
                                      color: Colors.grey),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: height * 0.04,
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: width * 0.05),
                          child: TextField(
                              controller: confirmPasswordTextEditingController,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: "Confirmar Senha * ",
                                hintStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.8),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      width: 1,
                                      style: BorderStyle.solid,
                                      color: Colors.green),
                                ),
                                filled: true,
                                fillColor: Colors.grey[200],
                                contentPadding: const EdgeInsets.all(12),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      width: 1,
                                      style: BorderStyle.solid,
                                      color: Colors.grey),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: height * 0.07,
                        ),
                        Center(
                          child: CupertinoButton(
                            color: Colors.green,
                            child: const Text("Criar conta"),
                            onPressed: () {
                              controller.signup(
                                email: emailTextEditingController.text,
                                name: nameTextEditingController.text,
                                password: passwordTextEditingController.text,
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      LoginScreen(), // redirecionar para tela de contact
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
