import 'package:flutter/material.dart';
import 'package:oshigamimeguri/my_colors.dart';

class FromBox extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  const FromBox({Key? key, required this.height, required this.width, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: MyColors.primary, width: 8),
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        color: MyColors.transmission,
        boxShadow: [
          BoxShadow(
            color: MyColors.shadow, //色
            spreadRadius: 7,
            blurRadius: 5,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: child,
    );
  }
}
