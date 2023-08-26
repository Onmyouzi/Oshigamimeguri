import 'package:flutter/material.dart';
import 'package:oshigamimeguri/page_oshigami_reqistration.dart';
import 'package:oshigamimeguri/page_sign_in.dart';
import 'package:oshigamimeguri/page_sign_up.dart';

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
        '/signUp': (context) => const PageSignUp(),
        '/signUp/oshigamiReqistration': (context) =>
            const PageOshigamiReqistration(),
      },
    );
  }
}
