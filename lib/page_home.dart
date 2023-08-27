import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: _screenSize.width,
            height: _screenSize.height * 0.2,
            child: Image.asset('images/headerLogo.png'),
          ),
          Container(
            width: _screenSize.width,
            height: _screenSize.height * 0.6,
            child: Column(children: [
              Container(
                width: _screenSize.width,
                height: _screenSize.height * 0.1 * 0.6,
                child: Image.asset('images/getema.png'),
              ),
              Container(
                width: _screenSize.width,
                height: _screenSize.height * 0.1,
                child: Image.asset('images/oshigaminame.png'),
              ),
              Container(
                width: _screenSize.width,
                height: _screenSize.height * 0.4,
                child: Image.asset('images/amaterasu.png'),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
