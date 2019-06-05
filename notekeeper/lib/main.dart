import 'package:flutter/material.dart';
import 'package:notekeeper/screens/note_details.dart';
import 'package:notekeeper/screens/note_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Notekeeper",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: NoteList(),
    );
  }

}