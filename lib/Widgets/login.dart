import 'package:flutter/material.dart';
//import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:todo/Widgets/login_secreen.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginScreen(),
    );
  }
}
