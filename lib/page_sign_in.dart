import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oshigamimeguri/background.dart';
import 'package:oshigamimeguri/custom_form_elevated_button.dart';
import 'package:oshigamimeguri/custom_form_show_dialog.dart';
import 'package:oshigamimeguri/custom_form_text_button.dart';
import 'package:oshigamimeguri/custom_form_text_form_field.dart';
import 'package:oshigamimeguri/from_box.dart';

class PageSignIn extends StatelessWidget {
  const PageSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final double headerHeight = size.height * 0.2;
    final header = SizedBox(
      height: headerHeight,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Image.asset(
          'images/headerLogo.png',
        ),
      ),
    );

    final form0 = GlobalKey<FormState>();
    final double formHeight = size.height * 0.8;
    final boxHeight = formHeight * 0.9;
    final boxWidth = size.width * 0.9;
    String email = '';
    String password = '';

    final form = SizedBox(
      height: formHeight,
      child: Center(
        child: FromBox(
          height: boxHeight,
          width: boxWidth,
          child: Form(
            key: form0,
            child: Column(
              children: [
                SizedBox(
                  height: boxHeight * 0.2 - 8,
                  child: const Center(
                    child: Text(
                      'ログイン',
                      style:
                          TextStyle(fontSize: 48, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                SizedBox(
                  height: boxHeight * 0.4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomTextFormField(
                        height: boxHeight * 0.14,
                        width: boxWidth * 0.9,
                        text: 'メールアドレス',
                        textInputAction: TextInputAction.next,
                        onSaved: (value) {
                          email = value;
                        },
                      ),
                      CustomTextFormField(
                        height: boxHeight * 0.14,
                        width: boxWidth * 0.9,
                        obscureText: true,
                        text: 'パスワード',
                        onSaved: (value) {
                          password = value;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: boxHeight * 0.4 - 8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomFormElevatedButton(
                        height: (boxHeight * 0.4 - 8) * 0.23,
                        width: boxWidth * 0.6,
                        text: 'ログイン',
                        onPressed: () async {
                          form0.currentState?.save();
                          try {
                            /// credential にはアカウント情報が記録される
                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                              email: email,
                              password: password,
                            );
                            context.go('/');
                          }

                          /// サインインに失敗した場合のエラー処理
                          on FirebaseAuthException catch (e) {
                            /// メールアドレスが無効の場合
                            if (e.code == 'invalid-email') {
                              customFormShowDialog(context, 'メールアドレスが無効です');
                            }

                            /// ユーザーが存在しない場合
                            else if (e.code == 'user-not-found') {
                              customFormShowDialog(context, 'ユーザーが存在しません');
                            }

                            /// パスワードが間違っている場合
                            else if (e.code == 'wrong-password') {
                              customFormShowDialog(context, 'パスワードが間違っています');
                            }

                            /// その他エラー
                            else {
                              customFormShowDialog(context, 'サインインエラー');
                            }
                          }
                        },
                      ),
                      CustomFormTextButton(
                        text: '新規登録はこちら',
                        onPressed: () {
                          context.go('/signUp');
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          final FocusScopeNode currentScope = FocusScope.of(context);
          if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
        },
        child: Stack(
          children: [
            const Background(),
            SizedBox(
              child: Column(
                children: [
                  header,
                  form,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
