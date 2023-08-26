import 'package:flutter/material.dart';
import 'package:oshigamimeguri/background.dart';
import 'package:oshigamimeguri/custom_form_elevated_button.dart';
import 'package:oshigamimeguri/from_box.dart';
import 'package:oshigamimeguri/my_colors.dart';

class PageOshigamiReqistration extends StatefulWidget {
  const PageOshigamiReqistration({Key? key}) : super(key: key);

  @override
  _PageOshigamiReqistrationState createState() =>
      _PageOshigamiReqistrationState();
}

class _PageOshigamiReqistrationState extends State<PageOshigamiReqistration> {
  int _selectedValueIndex = 1;

  List odhigamiName = ['須佐能', '天照', '月詠'];

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
                          '推し神登録',
                          style: TextStyle(
                              fontSize: 48, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: boxHeight * 0.55,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: boxHeight * 0.55 * 0.3,
                            child: const Text(
                              '推しの神様を選んでください！',
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                          SizedBox(
                            height: boxHeight * 0.55 * 0.3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  '推し神名：',
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  odhigamiName[_selectedValueIndex],
                                  style: TextStyle(
                                    fontSize: 48,
                                    fontWeight: FontWeight.bold,
                                    color: MyColors.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: boxHeight * 0.55 * 0.4,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Text(
                                        '須佐能',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: _selectedValueIndex == 0
                                              ? FontWeight.bold
                                              : null,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.cyanAccent,
                                      onTap: () {
                                        setState(() {
                                          _selectedValueIndex = 0;
                                        });
                                      },
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: _selectedValueIndex == 0
                                                ? boxWidth * 0.28
                                                : boxWidth * 0.25,
                                            width: _selectedValueIndex == 0
                                                ? boxWidth * 0.28
                                                : boxWidth * 0.25,
                                            decoration: BoxDecoration(
                                              color: Colors.blue,
                                              border: Border.all(
                                                  color: MyColors.primary,
                                                  width: 8),
                                              borderRadius:
                                                  BorderRadius.circular(24),
                                            ),
                                            child: Center(
                                              child: Image.asset(
                                                  'images/susanou.png'),
                                            ),
                                          ),
                                          if (_selectedValueIndex != 0)
                                            Container(
                                              height: boxWidth * 0.25,
                                              width: boxWidth * 0.25,
                                              decoration: BoxDecoration(
                                                color: const Color(0x50000000),
                                                borderRadius:
                                                    BorderRadius.circular(24),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Text(
                                        '天照',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: _selectedValueIndex == 1
                                              ? FontWeight.bold
                                              : null,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.cyanAccent,
                                      focusColor: Colors.pink,
                                      onTap: () {
                                        setState(() {
                                          _selectedValueIndex = 1;
                                        });
                                      },
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: _selectedValueIndex == 1
                                                ? boxWidth * 0.28
                                                : boxWidth * 0.25,
                                            width: _selectedValueIndex == 1
                                                ? boxWidth * 0.28
                                                : boxWidth * 0.25,
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              border: Border.all(
                                                  color: MyColors.primary,
                                                  width: 8),
                                              borderRadius:
                                                  BorderRadius.circular(24),
                                            ),
                                            child: Center(
                                              child: Image.asset(
                                                  'images/amaterasu.png'),
                                            ),
                                          ),
                                          if (_selectedValueIndex != 1)
                                            Container(
                                              height: boxWidth * 0.25,
                                              width: boxWidth * 0.25,
                                              decoration: BoxDecoration(
                                                color: const Color(0x50000000),
                                                borderRadius:
                                                    BorderRadius.circular(24),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Text(
                                        '月詠',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: _selectedValueIndex == 2
                                              ? FontWeight.bold
                                              : null,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.cyanAccent,
                                      onTap: () {
                                        setState(() {
                                          _selectedValueIndex = 2;
                                        });
                                      },
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: _selectedValueIndex == 2
                                                ? boxWidth * 0.28
                                                : boxWidth * 0.25,
                                            width: _selectedValueIndex == 2
                                                ? boxWidth * 0.28
                                                : boxWidth * 0.25,
                                            decoration: BoxDecoration(
                                              color: Colors.yellow,
                                              border: Border.all(
                                                  color: MyColors.primary,
                                                  width: 8),
                                              borderRadius:
                                                  BorderRadius.circular(24),
                                            ),
                                            child: Center(
                                              child: Image.asset(
                                                  'images/stukuyomi.png'),
                                            ),
                                          ),
                                          if (_selectedValueIndex != 2)
                                            Container(
                                              height: boxWidth * 0.25,
                                              width: boxWidth * 0.25,
                                              decoration: BoxDecoration(
                                                color: const Color(0x50000000),
                                                borderRadius:
                                                    BorderRadius.circular(24),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: boxHeight * 0.25 - 8,
                      child: Align(
                        alignment: const Alignment(0, -0.3),
                        child: CustomFormElevatedButton(
                          height: (boxHeight * 0.4 - 8) * 0.2,
                          width: boxWidth * 0.6,
                          text: '登録',
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed('/signUp/oshigamiReqistration');
                          },
                        ),
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
