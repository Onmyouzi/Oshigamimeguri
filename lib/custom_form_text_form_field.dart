import 'package:flutter/material.dart';
import 'package:oshigamimeguri/my_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final bool obscureText;
  final TextInputAction textInputAction;
  final Function onChenge;
  const CustomTextFormField({
    Key? key,
    required this.height,
    required this.width,
    required this.text,
    this.obscureText = false,
    this.onChenge = _defaultOnOnSaved,
    this.textInputAction = TextInputAction.done,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        children: [
          Align(
            alignment: const Alignment(0, 1),
            child: FractionallySizedBox(
              heightFactor: 0.65,
              widthFactor: 0.9,
              child: Container(
                padding: EdgeInsets.fromLTRB(width * 0.05, 0, width * 0.05, 0),
                decoration: BoxDecoration(
                  border: Border.all(color: MyColors.primary, width: 6),
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  color: MyColors.body,
                ),
                child: TextField(
                  obscureText: obscureText,
                  textInputAction: textInputAction,
                  onChanged: (value) {
                    onChenge(value);
                  },
                  style: const TextStyle(fontSize: 24),
                  cursorColor: MyColors.primary,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          FractionallySizedBox(
            heightFactor: 0.5,
            widthFactor: 0.6,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: MyColors.primary, width: 6),
                borderRadius: const BorderRadius.all(Radius.circular(24)),
                color: MyColors.body,
              ),
              child: Center(
                child: Text(
                  text,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static void _defaultOnOnSaved(String? value) {}
}
