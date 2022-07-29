import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:musicproject2/Notepage.dart';
import 'package:musicproject2/Settings.dart';
import 'package:file_picker/file_picker.dart';
import 'package:musicproject2/Widget.dart';
import 'package:musicproject2/databasehelper.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

import 'imagedisplay.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyPage> createState() => _MyNextState();
}

class _MyNextState extends State<MyPage> {
  //Global variable is like counter,
  //It can be acessed from all methods in the class (_MyNextState)
  int _counter = 0;
  List<PlatformFile>? _paths;
  FileType _pickingType = FileType.custom;
  String? _fileName;
  bool _isLoading = false;
  String userurl = 'http://5320-34-75-174-229.ngrok.io';
  List<dynamic> _path3D = [];
  int _n = 0;
  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  final recorder = FlutterSoundRecorder();
  databasehelper _dbHelper = databasehelper();

  @override
  void initState() {
    super.initState();
    //
    // initRecorder();
  }

  @override
  void dispose() {
    // recorder.closeRecorder();
    super.dispose();
  }

  void _uploadFiletoServer() async {
    var url = userurl + '/sheetMusic';
    Map<String, String> headers = {
      "Connection": "Keep-Alive",
      "Keep-Alive": "timeout=10, max=1000"
    };

    String? path = _paths![0].path!.substring(1);
    http.MultipartRequest request =
        http.MultipartRequest('POST', Uri.parse('$url'));
    request.headers.addAll(headers);
    request.files.add(
      await http.MultipartFile.fromPath(
        'song',
        path,
        //contentType: MediaType('audio', 'midi'),
      ),
    );

    request.send().then((r) async {
      print(r.statusCode);
      // print(json.decode(await r.stream.transform(utf8.decoder).join()));
      if (r.statusCode == 200) {
        var result = json.decode(await r.stream
            .transform(utf8.decoder)
            .join()); //result is going to be a list,
        // Directory tempDir = await getTemporaryDirectory();
        // _fileName3D = 'Audio3D';
        print(result);
        _path3D = result;
        //how to acess elemnts at a index of array
        // #try to just get the string aka no square brackets
        //toString()
        //Jackwagner654@gmail.com
        // setState(() {
        //   _path3D = result;
        //   print(result);
        //   print(_path3D);
        //   // Try Image.network(string) here
        //   // https://firebasestorage.googleapis.com/v0/b/musicsheetproject.appspot.com/o/music%2FMOZ%2FMOZ-1.png?alt=media&token=9642b110-60c5-4103-ac50-43674a050956
        // });
        // The next line disables the wakelock again.

      } else {
        print("Failed to get the response correctly!");

        // The next line disables the wakelock again.

      }
    });
    String link =
        "https://firebasestorage.googleapis.com/v0/b/msuci-thingy.appspot.com/o/music%2Fbeet%2Fbeet-1.png?alt=media&token=2797ca7f-0194-48ac-a451-802d42eb9902";

    TaskCardWidget _newTask = TaskCardWidget("Example" + _n.toString(), link, "1");
    _n++;
    _dbHelper.insertTask(_newTask);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ImagePage("this title",
                "https://firebasestorage.googleapis.com/v0/b/msuci-thingy.appspot.com/o/music%2Fbeet%2Fbeet-1.png?alt=media&token=2797ca7f-0194-48ac-a451-802d42eb9902")));
  }

  Future initRecorder() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw "microphone permission not granted";
    }
  }

  Future record() async {
    print("Hello");
    await recorder.startRecorder(toFile: 'audio');
  }

  Future stop() async {
    await recorder.stopRecorder();
  }

  void Notepush() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MyPage32(title: 'awefrsd')));
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    print('hello');
  }

  void _logException(String message) {
    print(message);
    _scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
    _scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void pickFiles() async {

    _resetState();
    try {
      _paths = (await FilePicker.platform.pickFiles(
        type: _pickingType,
        onFileLoading: (FilePickerStatus status) => print(status),
        allowedExtensions: ['mp3', 'wav'],
      ))
          ?.files;
      _uploadFiletoServer();
    } catch (e) {
      _logException(e.toString());
    }
  }

  void _resetState() {
    if (!mounted) {
      return;
    }
    setState(() {
      _fileName = null;
      _paths = null;
      _isLoading = false;
    });
  }

  void pagepush() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => My1Page(title: 'My1Page')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: pickFiles),
        appBar: AppBar(
          title: Text("Homepage"),
          actions: [
            IconButton(onPressed: pagepush, icon: Icon(Icons.settings)),
            IconButton(onPressed: _uploadFiletoServer, icon: Icon(Icons.upload))
          ],
        ),
        //Use the Image.network
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          //put your Image.network here
          InkWell(
              child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
                height: 200.0,
                width: 350.0,
                color: Colors.blue,
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Record", style: TextStyle(fontSize: 50)),
                )),
          )),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            InkWell(
                //History Button
                onTap: () {
                  Notepush();
                },
                child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Container(
                        height: 200.0,
                        width: 170.0,
                        color: Colors.blue,
                        child: Align(
                          alignment: Alignment.center,
                          child:
                              Text("History", style: TextStyle(fontSize: 50)),
                        )))),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: InkWell(
                  //File Button
                  onTap: pickFiles,

                  child: Container(
                      height: 200.0,
                      width: 170.0,
                      color: Colors.blue,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("File", style: TextStyle(fontSize: 50)),
                      ))),
            )
          ]),
        ])
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
