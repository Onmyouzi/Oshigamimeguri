import 'package:flutter/material.dart';
class TestPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Test3"),
        ),
        body: Center(
            child: TextButton(
                onPressed: () => {Navigator.of(context).pop()},
                child: Text("戻る", style: TextStyle(fontSize: 80)))));
  }
}
