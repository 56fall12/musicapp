import 'package:flutter/material.dart';
import 'package:musicproject2/notes.dart';
import 'Notepage.dart';

class My1Page extends StatefulWidget {
  const My1Page({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<My1Page> createState() => _MyNext1State();
}

class _MyNext1State extends State<My1Page> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    print('hello');
  }

  void pagepush() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MyPage321(title: 'DeleteNotes')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [

          Padding(
              padding: EdgeInsets.all(5.0),
              child: Container(
                child: SingleChildScrollView(
                    child: Column(
                  children: [Text("Setting")],
                )),
                height: 300.0,
                width: 250.0,
                color: Colors.grey,
              )),
          Row(mainAxisAlignment: MainAxisAlignment.center),
          InkWell(
              onTap: () { pagepush();},
          child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Container(
                child: Align(
                    alignment: Alignment.center, child: (Text("Delete Page "))),
                height: 50.0,
                width: 200.0,
                color: Colors.lightBlue,
              ))),
          InkWell(
          child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Container(
                child: Align(
                    alignment: Alignment.center, child: (Text("Delete All Pages "))),
                height: 50.0,
                width: 200.0,
                color: Colors.lightGreenAccent,
              )))
        ],
      ),
      appBar: AppBar(
        actions: [],
        title: Text("Settings"),
      ),
    );
  }
}
