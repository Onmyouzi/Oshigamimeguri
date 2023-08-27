import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oshigamimeguri/page_explain.dart';
import 'package:oshigamimeguri/page_navi.dart';
import 'package:oshigamimeguri/page_oshigami_reqistration.dart';
import 'package:oshigamimeguri/page_sign_in.dart';
import 'package:oshigamimeguri/page_sign_up.dart';
import 'package:oshigamimeguri/firebase_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const ProviderScope(child: MyApp()));
}

final GoRouter _router = GoRouter(


  initialLocation: '/signIn',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const PageNavi();
      },
    ),
    GoRoute(
      path: '/signIn',
      builder: (BuildContext context, GoRouterState state) {
        return const PageSignIn();
      },
    ),
    GoRoute(
      path: '/signUp',
      builder: (BuildContext context, GoRouterState state) {
        return const PageSignUp();
      },
      routes: [
        GoRoute(
          path: 'oshigamiReqistration',
          builder: (BuildContext context, GoRouterState state) {
            return const PageOshigamiReqistration();
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
