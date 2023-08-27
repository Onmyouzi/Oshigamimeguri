import 'package:flutter/material.dart';
import 'package:oshigamimeguri/page_explain.dart';
import 'package:oshigamimeguri/shrine_cetner.dart';

class ShrineCard extends StatelessWidget {
  const ShrineCard({super.key, required this.shrine});

  final shrineCenter shrine;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final shrineconmponentsSize = screenSize.height * 0.06;
    final zinzyacomImage = Image.asset('images/zinzyacomwaku.png');

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Explain(
              shrine: shrine,
            ),
          ),
        );
      },
      child: Container(
        width: screenSize.width,
        height: shrineconmponentsSize,
        child: Stack(
          children: [
            zinzyacomImage,
            Center(
              child: Text(shrine.name),
            )
          ],
        ),
      ),
    );
  }
}
