import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Widget.dart';
class databasehelper{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String title = "unnamed task";
  final List<TaskCardWidget> data = <TaskCardWidget>[];
  late UserCredential user;
  static String uid = "123";
  List<dynamic> myJson = [];
  String myTitle = "Enter Text";

  insertTask(TaskCardWidget task) async {
    DatabaseReference _db1 = FirebaseDatabase.instance.ref();
    _db1.child('tasks').child(task.title).set(task.toMap());
  }

}
