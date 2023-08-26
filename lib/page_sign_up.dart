import 'package:flutter/material.dart';
import 'package:oshigamimeguri/background.dart';
import 'package:oshigamimeguri/custom_form_elevated_button.dart';
import 'package:oshigamimeguri/custom_form_text_button.dart';
import 'package:oshigamimeguri/custom_form_text_form_field.dart';
import 'package:oshigamimeguri/from_box.dart';

class PageSignUp extends StatelessWidget {
  const PageSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double boxHeight = size.height * 0.8;
    final double boxWidth = size.width * 0.9;

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
            Align(
              alignment: Alignment(0, 0.3),
              child: FromBox(
                height: boxHeight,
                width: boxWidth,
                child: Column(
                  children: [
                    Container(
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
                    Container(
                      height: boxHeight * 0.55,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomTextFormField(
                            height: boxHeight * 0.14,
                            width: boxWidth * 0.9,
                            text: 'メールアドレス',
                            textInputAction: TextInputAction.next,
                            onSaved: (value) {},
                          ),
                          CustomTextFormField(
                            height: boxHeight * 0.14,
                            width: boxWidth * 0.9,
                            obscureText: true,
                            text: 'パスワード',
                            onSaved: (value) {},
                          ),
                          CustomTextFormField(
                            height: boxHeight * 0.14,
                            width: boxWidth * 0.9,
                            obscureText: true,
                            text: '確認パスワード',
                            onSaved: (value) {},
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: boxHeight * 0.25 - 8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomFormElevatedButton(
                            height: (boxHeight * 0.4 - 8) * 0.23,
                            width: boxWidth * 0.6,
                            text: '登録',
                            onPressed: () {},
                          ),
                          CustomFormTextButton(
                            text: 'ログインはこちら',
                            onPressed: () {
                              Navigator.of(context).pushNamed('/signIn');
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
