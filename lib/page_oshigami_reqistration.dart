import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:oshigamimeguri/background.dart';
import 'package:oshigamimeguri/custom_form_elevated_button.dart';
import 'package:oshigamimeguri/custom_form_show_dialog.dart';
import 'package:oshigamimeguri/from_box.dart';
import 'package:oshigamimeguri/my_colors.dart';
import 'package:oshigamimeguri/user_info.dart';

class PageOshigamiReqistration extends HookConsumerWidget {
  const PageOshigamiReqistration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(userInfoProvider);
    final Size size = MediaQuery.of(context).size;
    final double boxHeight = size.height * 0.8;
    final double boxWidth = size.width * 0.9;

    final selectedValueIndex = useState(900000002);
    const int susanou = 900000003;
    const int amaterasu = 900000002;
    const int stukunomi = 900000008;

    Map odhigamiName = {900000003: '須佐能', 900000002: '天照', 900000008: '月詠'};

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
                              style: TextStyle(fontSize: 20),
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
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  odhigamiName[selectedValueIndex.value],
                                  style: TextStyle(
                                    fontSize: 40,
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
                                          fontWeight:
                                              selectedValueIndex.value ==
                                                      susanou
                                                  ? FontWeight.bold
                                                  : null,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.cyanAccent,
                                      onTap: () {
                                        selectedValueIndex.value = susanou;
                                      },
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: selectedValueIndex.value ==
                                                    susanou
                                                ? boxWidth * 0.28
                                                : boxWidth * 0.25,
                                            width: selectedValueIndex.value ==
                                                    susanou
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
                                          if (selectedValueIndex.value !=
                                              susanou)
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
                                          fontWeight:
                                              selectedValueIndex.value ==
                                                      amaterasu
                                                  ? FontWeight.bold
                                                  : null,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.cyanAccent,
                                      focusColor: Colors.pink,
                                      onTap: () {
                                        selectedValueIndex.value = amaterasu;
                                      },
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: selectedValueIndex.value ==
                                                    amaterasu
                                                ? boxWidth * 0.28
                                                : boxWidth * 0.25,
                                            width: selectedValueIndex.value ==
                                                    amaterasu
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
                                          if (selectedValueIndex.value !=
                                              amaterasu)
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
                                          fontWeight:
                                              selectedValueIndex.value ==
                                                      stukunomi
                                                  ? FontWeight.bold
                                                  : null,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.cyanAccent,
                                      onTap: () {
                                        selectedValueIndex.value = stukunomi;
                                      },
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: selectedValueIndex.value ==
                                                    stukunomi
                                                ? boxWidth * 0.28
                                                : boxWidth * 0.25,
                                            width: selectedValueIndex.value ==
                                                    stukunomi
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
                                          if (selectedValueIndex.value !=
                                              stukunomi)
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
                          onPressed: () async {
                            try {
                              final auth = FirebaseAuth.instance;
                              final store = FirebaseFirestore.instance;

                              // credential にはアカウント情報が記録される
                              await auth.createUserWithEmailAndPassword(
                                email: userInfo['email'],
                                password: userInfo['password'],
                              );

                              store
                                  .collection('users')
                                  .doc(auth.currentUser?.uid)
                                  .set(
                                {'oshigamiID': '${selectedValueIndex.value}'},
                              );

                              context.go('/');
                            } catch (e) {
                              customFormShowDialog(context, '登録ができませんでした');
                            }
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

// class PageOshigamiReqistration extends StatefulWidget {
//   const PageOshigamiReqistration({Key? key}) : super(key: key);

//   @override
//   _PageOshigamiReqistrationState createState() =>
//       _PageOshigamiReqistrationState();
// }

// class _PageOshigamiReqistrationState extends State<PageOshigamiReqistration> {
//   int _selectedValueIndex = 900000002;
//   final int susanou = 900000003;
//   final int amaterasu = 900000002;
//   final int stukunomi = 900000008;

//   Map odhigamiName = {900000003: '須佐能', 900000002: '天照', 900000008: '月詠'};

//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     final double boxHeight = size.height * 0.8;
//     final double boxWidth = size.width * 0.9;

//     return Scaffold(
//       body: GestureDetector(
//         onTap: () {
//           final FocusScopeNode currentScope = FocusScope.of(context);
//           if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
//             FocusManager.instance.primaryFocus!.unfocus();
//           }
//         },
//         child: Stack(
//           children: [
//             const Background(),
//             Align(
//               alignment: const Alignment(0, 0.3),
//               child: FromBox(
//                 height: boxHeight,
//                 width: boxWidth,
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: boxHeight * 0.2 - 8,
//                       child: const Align(
//                         alignment: Alignment(0, 0.5),
//                         child: Text(
//                           '推し神登録',
//                           style: TextStyle(
//                               fontSize: 48, fontWeight: FontWeight.w600),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: boxHeight * 0.55,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Container(
//                             alignment: Alignment.center,
//                             height: boxHeight * 0.55 * 0.3,
//                             child: const Text(
//                               '推しの神様を選んでください！',
//                               style: TextStyle(fontSize: 20),
//                             ),
//                           ),
//                           SizedBox(
//                             height: boxHeight * 0.55 * 0.3,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 const Text(
//                                   '推し神名：',
//                                   style: TextStyle(
//                                     fontSize: 32,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 Text(
//                                   odhigamiName[_selectedValueIndex],
//                                   style: TextStyle(
//                                     fontSize: 40,
//                                     fontWeight: FontWeight.bold,
//                                     color: MyColors.primary,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(
//                             height: boxHeight * 0.55 * 0.4,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Center(
//                                       child: Text(
//                                         '須佐能',
//                                         style: TextStyle(
//                                           fontSize: 16,
//                                           fontWeight:
//                                               _selectedValueIndex == susanou
//                                                   ? FontWeight.bold
//                                                   : null,
//                                         ),
//                                       ),
//                                     ),
//                                     InkWell(
//                                       splashColor: Colors.cyanAccent,
//                                       onTap: () {
//                                         setState(() {
//                                           _selectedValueIndex = susanou;
//                                         });
//                                       },
//                                       child: Stack(
//                                         children: [
//                                           Container(
//                                             height:
//                                                 _selectedValueIndex == susanou
//                                                     ? boxWidth * 0.28
//                                                     : boxWidth * 0.25,
//                                             width:
//                                                 _selectedValueIndex == susanou
//                                                     ? boxWidth * 0.28
//                                                     : boxWidth * 0.25,
//                                             decoration: BoxDecoration(
//                                               color: Colors.blue,
//                                               border: Border.all(
//                                                   color: MyColors.primary,
//                                                   width: 8),
//                                               borderRadius:
//                                                   BorderRadius.circular(24),
//                                             ),
//                                             child: Center(
//                                               child: Image.asset(
//                                                   'images/susanou.png'),
//                                             ),
//                                           ),
//                                           if (_selectedValueIndex != susanou)
//                                             Container(
//                                               height: boxWidth * 0.25,
//                                               width: boxWidth * 0.25,
//                                               decoration: BoxDecoration(
//                                                 color: const Color(0x50000000),
//                                                 borderRadius:
//                                                     BorderRadius.circular(24),
//                                               ),
//                                             ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Center(
//                                       child: Text(
//                                         '天照',
//                                         style: TextStyle(
//                                           fontSize: 16,
//                                           fontWeight:
//                                               _selectedValueIndex == amaterasu
//                                                   ? FontWeight.bold
//                                                   : null,
//                                         ),
//                                       ),
//                                     ),
//                                     InkWell(
//                                       splashColor: Colors.cyanAccent,
//                                       focusColor: Colors.pink,
//                                       onTap: () {
//                                         setState(() {
//                                           _selectedValueIndex = amaterasu;
//                                         });
//                                       },
//                                       child: Stack(
//                                         children: [
//                                           Container(
//                                             height:
//                                                 _selectedValueIndex == amaterasu
//                                                     ? boxWidth * 0.28
//                                                     : boxWidth * 0.25,
//                                             width:
//                                                 _selectedValueIndex == amaterasu
//                                                     ? boxWidth * 0.28
//                                                     : boxWidth * 0.25,
//                                             decoration: BoxDecoration(
//                                               color: Colors.red,
//                                               border: Border.all(
//                                                   color: MyColors.primary,
//                                                   width: 8),
//                                               borderRadius:
//                                                   BorderRadius.circular(24),
//                                             ),
//                                             child: Center(
//                                               child: Image.asset(
//                                                   'images/amaterasu.png'),
//                                             ),
//                                           ),
//                                           if (_selectedValueIndex != amaterasu)
//                                             Container(
//                                               height: boxWidth * 0.25,
//                                               width: boxWidth * 0.25,
//                                               decoration: BoxDecoration(
//                                                 color: const Color(0x50000000),
//                                                 borderRadius:
//                                                     BorderRadius.circular(24),
//                                               ),
//                                             ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Center(
//                                       child: Text(
//                                         '月詠',
//                                         style: TextStyle(
//                                           fontSize: 16,
//                                           fontWeight:
//                                               _selectedValueIndex == stukunomi
//                                                   ? FontWeight.bold
//                                                   : null,
//                                         ),
//                                       ),
//                                     ),
//                                     InkWell(
//                                       splashColor: Colors.cyanAccent,
//                                       onTap: () {
//                                         setState(() {
//                                           _selectedValueIndex = stukunomi;
//                                         });
//                                       },
//                                       child: Stack(
//                                         children: [
//                                           Container(
//                                             height:
//                                                 _selectedValueIndex == stukunomi
//                                                     ? boxWidth * 0.28
//                                                     : boxWidth * 0.25,
//                                             width:
//                                                 _selectedValueIndex == stukunomi
//                                                     ? boxWidth * 0.28
//                                                     : boxWidth * 0.25,
//                                             decoration: BoxDecoration(
//                                               color: Colors.yellow,
//                                               border: Border.all(
//                                                   color: MyColors.primary,
//                                                   width: 8),
//                                               borderRadius:
//                                                   BorderRadius.circular(24),
//                                             ),
//                                             child: Center(
//                                               child: Image.asset(
//                                                   'images/stukuyomi.png'),
//                                             ),
//                                           ),
//                                           if (_selectedValueIndex != stukunomi)
//                                             Container(
//                                               height: boxWidth * 0.25,
//                                               width: boxWidth * 0.25,
//                                               decoration: BoxDecoration(
//                                                 color: const Color(0x50000000),
//                                                 borderRadius:
//                                                     BorderRadius.circular(24),
//                                               ),
//                                             ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: boxHeight * 0.25 - 8,
//                       child: Align(
//                         alignment: const Alignment(0, -0.3),
//                         child: CustomFormElevatedButton(
//                           height: (boxHeight * 0.4 - 8) * 0.2,
//                           width: boxWidth * 0.6,
//                           text: '登録',
//                           onPressed: () async {
//                             try {
//                               final auth = FirebaseAuth.instance;
//                               final store = FirebaseFirestore.instance;

//                               /// credential にはアカウント情報が記録される
//                               // await auth.createUserWithEmailAndPassword(
//                               //   email: args.email,
//                               //   password: args.password,
//                               // );

//                               store
//                                   .collection('users')
//                                   .doc(auth.currentUser?.uid)
//                                   .set({'oshigamiID': _selectedValueIndex});

//                               context.go('/home');
//                             } catch (e) {
//                               customFormShowDialog(context, '登録ができませんでした');
//                             }
//                           },
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

