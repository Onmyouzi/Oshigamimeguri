import 'package:flutter/material.dart';
import 'package:oshigamimeguri/my_colors.dart';

class CustomFormElevatedButton extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final Function onPressed;
  const CustomFormElevatedButton(
      {Key? key,
      required this.height,
      required this.width,
      required this.text,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.primary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        ),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }
}
