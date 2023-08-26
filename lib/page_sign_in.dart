import 'package:flutter/material.dart';
import 'package:oshigamimeguri/background.dart';
import 'package:oshigamimeguri/custom_form_elevated_button.dart';
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
                        onPressed: () {
                          form0.currentState?.save();
                          print(email);
                          print(password);
                        },
                      ),
                      CustomFormTextButton(
                        text: '新規登録はこちら',
                        onPressed: () {},
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
