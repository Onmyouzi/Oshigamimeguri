import 'package:flutter/material.dart';

class CustomFormTextButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  const CustomFormTextButton(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.play_arrow),
          Text(
            text,
          ),
        ],
      ),
    );
  }
}
