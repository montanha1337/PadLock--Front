import 'package:flutter/material.dart';
import 'package:pix/src/controller/user_controller.dart';
import 'package:pix/src/utils/storage_util.dart';
import 'package:pix/src/view/home/home_screen.dart';
import 'dart:async';

import 'package:pix/src/view/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final userController = UserController();
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () async {
      WidgetsFlutterBinding.ensureInitialized();
      //final localToken = await StorageUtil.getToken();
      //bool tokenGotPermission = false;
      //await userController
      //.tokenGotPermission(token: localToken.toString())
      //.then((value) => tokenGotPermission = true);

      //if (tokenGotPermission) {
      // Navigator.of(context).pushReplacement(
      //    MaterialPageRoute(builder: (_) => HomeScreen()),
      // );
      //} else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[700],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            // logo here
            Text(
              'Lock Pix',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
              ),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
