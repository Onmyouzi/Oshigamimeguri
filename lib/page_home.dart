import 'package:flutter/material.dart';
import 'package:oshigamimeguri/background.dart';
import 'package:oshigamimeguri/page_ema.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    determinePosition().then((value) => print(value));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          Column(
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
                    width: _screenSize.height * 0.6 * 0.4,
                    child: Image.asset('images/amaterasu_icon.png'),
                  ),
                ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
