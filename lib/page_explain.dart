import 'package:flutter/material.dart';

class Explain extends StatelessWidget {
  const Explain({super.key});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        Container(
          width: _screenSize.width,
          height: _screenSize.height * 0.2,
          child: Image.asset('images/headerLogo.png'),
        ),
        Container(
          alignment: Alignment.centerLeft,
          width: _screenSize.width,
          height: _screenSize.height * 0.4,
          child: Image.asset('images/backbutton.png'),
        ),
        Align(
          alignment: Alignment(0, -0.38),
          child: Container(
            width: _screenSize.width,
            height: _screenSize.height * 0.2,
            child: Image.asset('images/map.png'),
          ),
        ),
        Align(
          alignment: Alignment(0, 0.32),
          child: Container(
            width: _screenSize.width,
            height: _screenSize.height * 0.3,
            child: Image.asset('images/guideboard.png'),
          ),
        ),
        Align(
          alignment: Alignment(0, 0.7),
          child: Container(
            width: _screenSize.width,
            height: _screenSize.height * 0.1,
            child: Image.asset('images/effect.png'),
          ),
        ),
        Align(
          alignment: Alignment(0, 0.95),
          child: Container(
            width: _screenSize.width,
            height: _screenSize.height * 0.1,
            child: Image.asset('images/gobutton.png'),
          ),
        )
      ]),
    );
  }
}
