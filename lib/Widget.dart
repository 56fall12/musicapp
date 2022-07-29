import 'dart:convert';

// import 'DataBaseHelper.dart';
import 'package:flutter/material.dart';

import 'imagedisplay.dart';

class TaskCardWidget extends StatelessWidget {
  late final String title;
  late final String link;
  late final String date;

  // DatabaseHelper _db = DatabaseHelper();

  Map<String, String> toMap() {
    return {'title': title, 'link': link, 'date' : date};
  }
  TaskCardWidget(this.title, this.link, this.date);
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ImagePage(this.title, this.link)));
        print("hello");
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 200.0,
            width: 200.0,
            color: Colors.blue,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                      children: [Text(this.link)],
                      mainAxisAlignment: MainAxisAlignment.start),
                  Column(
                      children: [Text("Page")],
                      mainAxisAlignment: MainAxisAlignment.end),
                  Column(
                      children: [Text(this.date)],
                      mainAxisAlignment: MainAxisAlignment.start),
                ]),
          ),
        ),
      ),
    );
  }
}


