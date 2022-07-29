/*import 'dart:html';*/

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:musicproject2/Settings.dart';

import 'Widget.dart';

class MyPage32 extends StatefulWidget {
  const MyPage32({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyPage32> createState() => _MyNext22State();
}

class _MyNext22State extends State<MyPage32> {
  List<TaskCardWidget> data = [];
  void initState(){
    DatabaseReference _db1 = FirebaseDatabase.instance.ref();
    var ref = _db1.child('tasks');
    ref.onValue.listen((event) {
      //i = 0;
      int x = event.snapshot.children.length;
      print(x);
      data.clear();
      int t = 0;
      for (DataSnapshot i in event.snapshot.children){
        // title = event.snapshot.children.elementAt(i).value.toString();

        setState(() => data.insert(t, (TaskCardWidget(
          i.children.elementAt(0).value.toString(),
          i.children.elementAt(1).value.toString(),
          i.children.elementAt(2).value.toString(),
        ))));
        // data[t] = TaskCardWidget(i.children.elementAt(1).value.toString(), i.children.elementAt(0).value.toString());
        t++;
      };
    });
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes Page"),
        backgroundColor: Colors.black,
      ),
      body:Column(
        //padding: EdgeInsets.all(100.0),
        children: [
          Expanded(
              child: ListView(
                  children: data
              )
          )
        ]
        ),

        backgroundColor: Colors.black
    );
  }
}
