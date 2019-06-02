import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Exploring List Views",
    home: Scaffold(
      appBar: AppBar(title: Text("Basic List View"),),
      body: getListView(),
    ),
  ));
}

Widget getListView() {
  var listView = ListView(
    children: <Widget>[
      ListTile(
        title: Text("Landscape"),
        leading: Icon(Icons.landscape),
        subtitle: Text("Beautiful View"),
        trailing: Icon(Icons.wb_sunny),
        onTap: () {
          debugPrint("Landscape Pressed");
        },
      ),
      ListTile(
        title: Text("Windows"),
        leading: Icon(Icons.laptop_chromebook),
        onTap: () {
          debugPrint("Windows Pressed");
        },
      ),
      ListTile(
        title: Text("Phone"),
        leading: Icon(Icons.phone_android),
        onTap: () {
          debugPrint("Phone Pressed");
        },
      ),
    ],
  );
  return listView;
}