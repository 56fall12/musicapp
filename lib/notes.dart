/*import 'dart:html';*/

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:musicproject2/Settings.dart';

import 'Widget.dart';

class MyPage321 extends StatefulWidget {
  const MyPage321({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyPage321> createState() => _MyNext222State();
}

class _MyNext222State extends State<MyPage321> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Delete Notes Page"),
          backgroundColor: Colors.black,
        ),
        body:SingleChildScrollView(
          //padding: EdgeInsets.all(100.0),
          child: Column(
            /* mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,*/
            children: <Widget>[
              Dismissible(key: UniqueKey(),direction: DismissDirection.endToStart, child: Padding(
                padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 200.0,
                    width: 200.0,
                    color: Colors.blue,
                    child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget> [
                          Column(children: [Text("Name")], mainAxisAlignment: MainAxisAlignment.start),
                          Column(children: [Text("Page")], mainAxisAlignment: MainAxisAlignment.end),
                          Column(children: [Text("Date")], mainAxisAlignment: MainAxisAlignment.start),
                        ]
                    ),
                  ),
                ),
                )
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 200.0,
                    width: 200.0,
                    color: Colors.blue,
                    child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget> [
                          Column(children: [Text("Name")], mainAxisAlignment: MainAxisAlignment.start),
                          Column(children: [Text("Page")], mainAxisAlignment: MainAxisAlignment.end),
                          Column(children: [Text("Date")], mainAxisAlignment: MainAxisAlignment.start),
                        ]
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 200.0,
                    width: 200.0,
                    color: Colors.blue,
                    child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget> [
                          Column(children: [Text("Name")], mainAxisAlignment: MainAxisAlignment.start),
                          Column(children: [Text("Page")], mainAxisAlignment: MainAxisAlignment.end),
                          Column(children: [Text("Date")], mainAxisAlignment: MainAxisAlignment.start),
                        ]
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 200.0,
                    width: 200.0,
                    color: Colors.blue,
                    child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget> [
                          Column(children: [Text("Name")], mainAxisAlignment: MainAxisAlignment.start),
                          Column(children: [Text("Page")], mainAxisAlignment: MainAxisAlignment.end),
                          Column(children: [Text("Date")], mainAxisAlignment: MainAxisAlignment.start),
                        ]
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
        backgroundColor: Colors.black
    );
  }
}
