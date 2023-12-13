import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/Repository/authentication_repository.dart';
import 'package:todo/Widgets/login.dart';
import 'package:todo/Widgets/login_secreen.dart';
import 'package:todo/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthenticationRepository());
    return const GetMaterialApp(
      home: Login(),
    );
  }
}
