import 'package:candor_flutter/screens/signIn.dart';
import 'package:candor_flutter/screens/signUp.dart';
import 'package:candor_flutter/utils/auth_check.dart';
import 'firebase_options.dart';
import 'package:candor_flutter/utils/colours.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Candor',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      home: AuthCheck(),
    );
  }
}
