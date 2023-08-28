import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:oshigamimeguri/background.dart';
import 'package:oshigamimeguri/custom_form_elevated_button.dart';
import 'package:oshigamimeguri/custom_form_show_dialog.dart';
import 'package:oshigamimeguri/custom_form_text_button.dart';
import 'package:oshigamimeguri/custom_form_text_form_field.dart';
import 'package:oshigamimeguri/from_box.dart';
import 'package:oshigamimeguri/user_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class PageSignUp extends ConsumerWidget {
  const PageSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(userInfoProvider);
    final Size size = MediaQuery.of(context).size;
    final double boxHeight = size.height * 0.8;
    final double boxWidth = size.width * 0.9;

    final form1 = GlobalKey<FormState>();
    String email = '';
    String password = '';
    String checkPassword = '';

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            Align(
              alignment: const Alignment(0, 0.3),
              child: FromBox(
                height: boxHeight,
                width: boxWidth,
                child: Column(
                  children: [
                    SizedBox(
                      height: boxHeight * 0.2 - 8,
                      child: const Align(
                        alignment: Alignment(0, 0.5),
                        child: Text(
                          '新規登録',
                          style: TextStyle(
                              fontSize: 48, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: boxHeight * 0.55,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomTextFormField(
                            height: boxHeight * 0.13,
                            width: boxWidth * 0.9,
                            text: 'メールアドレス',
                            textInputAction: TextInputAction.next,
                            onChenge: (value) {
                              email = value;
                            },
                          ),
                          CustomTextFormField(
                            height: boxHeight * 0.13,
                            width: boxWidth * 0.9,
                            obscureText: true,
                            text: 'パスワード',
                            onChenge: (value) {
                              password = value;
                            },
                          ),
                          CustomTextFormField(
                            height: boxHeight * 0.13,
                            width: boxWidth * 0.9,
                            obscureText: true,
                            text: '確認パスワード',
                            onChenge: (value) {
                              checkPassword = value;
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: boxHeight * 0.25 - 8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomFormElevatedButton(
                            height: (boxHeight * 0.4 - 8) * 0.2,
                            width: boxWidth * 0.6,
                            text: '登録',
                            onPressed: () async {
                              final userInfoState =
                                  ref.watch(userInfoProvider.notifier);

                              if (password == checkPassword) {
                                try {
                                  final auth = FirebaseAuth.instance;

                                  /// credential にはアカウント情報が記録される
                                  await auth.createUserWithEmailAndPassword(
                                    email: email,
                                    password: password,
                                  );

                                  auth.currentUser?.delete();

                                  userInfoState.updateUserInfo(email, password);

                                  context.go('/signUp/oshigamiReqistration');
                                }

                                /// アカウントに失敗した場合のエラー処理
                                on FirebaseAuthException catch (e) {
                                  /// パスワードが弱い場合
                                  if (e.code == 'weak-password') {
                                    customFormShowDialog(context, 'パスワードが弱いです');

                                    /// メールアドレスが既に使用中の場合
                                  } else if (e.code == 'email-already-in-use') {
                                    customFormShowDialog(
                                        context, 'すでに使用されているメールアドレスです');
                                  }

                                  /// その他エラー
                                  else {
                                    customFormShowDialog(
                                        context, 'アカウント作成エラー: ${e}');
                                    print(e);
                                  }
                                } catch (e) {
                                  customFormShowDialog(context, '${e}');
                                }
                              } else {
                                customFormShowDialog(
                                    context, 'パスワードと確認パスワードが異なります');
                              }
                              context.go('/signUp/oshigamiReqistration');
                            },
                          ),
                          CustomFormTextButton(
                            text: 'ログインはこちら',
                            onPressed: () {
                              context.go('/signIn');
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
