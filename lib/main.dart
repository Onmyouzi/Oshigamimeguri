import 'package:flutter/material.dart';
import 'package:oshigamimeguri/page_sign_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/signIn',
      routes: {
        '/signIn': (context) => const PageSignIn(),
      },
    );
  }
}
