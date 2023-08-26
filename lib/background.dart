import 'package:flutter/material.dart';
import 'package:oshigamimeguri/my_colors.dart';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          colors: [
            MyColors.body,
            MyColors.secondary,
            MyColors.primary,
          ],
          stops: const [
            0.0,
            0.6,
            1.0,
          ],
        ),
      ),
    );
  }
}
