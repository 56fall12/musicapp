import 'package:flutter/material.dart';
import 'package:musicproject2/Settings.dart';

class MyPage3 extends StatefulWidget {
  const MyPage3({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyPage3> createState() => _MyNext2State();
}

class _MyNext2State extends State<MyPage3> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("owjshfe"),
          backgroundColor: Colors.black,
      ),
      body: Column(children: [Text("aoiefdj")],),
    );
  }
}

