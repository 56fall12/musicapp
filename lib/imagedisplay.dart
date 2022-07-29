import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImagePage extends StatefulWidget {

  String title;
  String link;
  ImagePage(this.title, this.link);

  @override
  State<ImagePage> createState() => ImagePageState();
}

class ImagePageState extends State<ImagePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(10.0),
                child: Image.network("https://firebasestorage.googleapis.com/v0/b/msuci-thingy.appspot.com/o/music%2Fbeet%2Fbeet-1.png?alt=media&token=2797ca7f-0194-48ac-a451-802d42eb9902")

            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
