import 'package:flutter/material.dart';
import 'package:oshigamimeguri/my_colors.dart';

void customFormShowDialog(BuildContext context, String errorText) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext dialogContext) {
      final double width = MediaQuery.of(context).size.width;
      return AlertDialog(
        buttonPadding: const EdgeInsets.all(20),
        title: Center(
            child: Text(
          errorText,
          style: const TextStyle(color: Colors.black),
        )),
        actions: <Widget>[
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), //丸み
          side: BorderSide(
            color: MyColors.primary,
            width: 8, //枠線の色
          ),
        ),
      );
    },
  );
}
