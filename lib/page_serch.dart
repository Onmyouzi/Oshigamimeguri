import 'package:flutter/material.dart';
import 'package:oshigamimeguri/background.dart';

class Serch extends StatelessWidget {
  const Serch({super.key});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final shrineconmponentsSize = _screenSize.height * 0.06;
    final zinzyacomImage = Image.asset('images/zinzyacomwaku.png');
    return Scaffold(
      backgroundColor: Colors.transparent,
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
                    height: shrineconmponentsSize,
                    child: zinzyacomImage,
                  ),
                  Container(
                    width: _screenSize.width,
                    height: shrineconmponentsSize,
                    child: zinzyacomImage,
                  ),
                  Container(
                    width: _screenSize.width,
                    height: shrineconmponentsSize,
                    child: zinzyacomImage,
                  ),
                  Container(
                    width: _screenSize.width,
                    height: shrineconmponentsSize,
                    child: zinzyacomImage,
                  ),
                  Container(
                    width: _screenSize.width,
                    height: shrineconmponentsSize,
                    child: zinzyacomImage,
                  ),
                  Container(
                    width: _screenSize.width,
                    height: shrineconmponentsSize,
                    child: zinzyacomImage,
                  ),
                  Container(
                    width: _screenSize.width,
                    height: shrineconmponentsSize,
                    child: zinzyacomImage,
                  ),
                  Container(
                    width: _screenSize.width,
                    height: shrineconmponentsSize,
                    child: zinzyacomImage,
                  ),
                  Container(
                    width: _screenSize.width,
                    height: shrineconmponentsSize,
                    child: zinzyacomImage,
                  ),
                  Container(
                    width: _screenSize.width,
                    height: shrineconmponentsSize,
                    child: zinzyacomImage,
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
