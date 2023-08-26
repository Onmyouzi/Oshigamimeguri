import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oshigamimeguri/page_oshigami_reqistration.dart';
import 'package:oshigamimeguri/page_sign_in.dart';
import 'package:oshigamimeguri/page_sign_up.dart';
import 'package:oshigamimeguri/firebase_options.dart';
import 'package:oshigamimeguri/page_ema.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(ProviderScope(child: const MyApp()));
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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
