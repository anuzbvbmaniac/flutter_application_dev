import 'package:flutter/material.dart';
import 'dart:async';
import 'package:notekeeper/utils/databse_helper.dart';
import 'package:notekeeper/model/note.dart';
import 'package:intl/intl.dart';

class NoteDetails extends StatefulWidget {
  String appBarTitle;
  final Note note;
  NoteDetails(this.note, this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return _NoteDetailsState(this.note, this.appBarTitle);
  }
}

class _NoteDetailsState extends State<NoteDetails> {
  var _formKey = GlobalKey<FormState>();

  static var _priorities = ['High', "Low"];

  DatabaseHelper databaseHelper = DatabaseHelper();

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  //for title change
  String appBarTitle;
  Note note;
  //constructor
  _NoteDetailsState(this.note, this.appBarTitle);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;

    titleController.text = note.title;
    descController.text = note.description;

    return WillPopScope(
      onWillPop: () {
        moveToLastScreen();
      },
      child: Scaffold(
        appBar: AppBar(
          //get Title from Parameter.
          title: Text(appBarTitle),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                moveToLastScreen();
              }),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.only(top: 16.0, right: 8.0, left: 8.0),
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: DropdownButton(
                    items: _priorities.map((String dropDownStringItems) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItems,
                        child: Text(dropDownStringItems),
                      );
                    }).toList(),
                    style: textStyle,
                    value: updatePriorityAsString(note.priority),
                    onChanged: (valueSelectedByUser) {
                      setState(() {
                        debugPrint("User selected $valueSelectedByUser");
                        updatePriorityAsInt(valueSelectedByUser);
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextField(
                    controller: titleController,
                    style: textStyle,
                    onChanged: (value) {
                      debugPrint("Changes In Text Field");
                      updateTitle();
                    },
                    decoration: InputDecoration(
                        labelStyle: textStyle,
                        labelText: "Title",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextField(
                    controller: descController,
                    style: textStyle,
                    onChanged: (value) {
                      debugPrint("Changes In Text Field");
                      updateDesc();
                    },
                    decoration: InputDecoration(
                        labelStyle: textStyle,
                        labelText: "Description",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          color: Theme.of(context).primaryColorDark,
                          textColor: Theme.of(context).primaryColorLight,
                          child: Text(
                            "Save",
                            textScaleFactor: 1.5,
                          ),
                          onPressed: () {
                            setState(() {
                              debugPrint("Save Button Clicked");
                              _save();
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 4.0),
                      Expanded(
                        child: RaisedButton(
                          color: Theme.of(context).primaryColorLight,
                          textColor: Theme.of(context).primaryColorDark,
                          child: Text(
                            "Delete",
                            textScaleFactor: 1.5,
                          ),
                          onPressed: () {
                            setState(() {
                              debugPrint("Delete Button Clicked");
                              _delete();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  //conmver string priority to int form before saving it to databse
  void updatePriorityAsInt(String value) {
    switch (value) {
      case 'High':
        note.priority = 1;
        break;
      case 'Low':
        note.priority = 2;
        break;
    }
  }

  //convert int priority to String priority and display it to the user
  String updatePriorityAsString(int value) {
    String priority;
    switch (value) {
      case 1:
        priority = _priorities[0];
        break;
      case 2:
        priority = _priorities[1];
        break;
    }
    return priority;
  }

  //update title of the Note Object
  void updateTitle() {
    note.title = titleController.text;
  }

  //update desc of the note object
  void updateDesc() {
    note.description = descController.text;
  }

  //save data to the database
  void _save() async {
    moveToLastScreen();

    note.date = DateFormat.yMMMd().format(DateTime.now());

    int result;
    if (note.id != null) {
      //Case 1 : Update Operation
      result = await databaseHelper.updateNote(note);
    } else {
      // Case 2 : Inser Operation
      result = await databaseHelper.insertNote(note);
    }
    if (result != 0) {
      // Success
      _showAlertDialouge('Status', 'Note Saved Successfullt');
    } else {
      //Failure
      _showAlertDialouge('Status', 'Problem saving Note!');
    }
  }

  void _showAlertDialouge(String title, String msg) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(msg),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }

  void _delete() async {
    moveToLastScreen();
    //Case 1 : User trying to delete the New Note , i.e. new note creation time
    if (note.id == null) {
      _showAlertDialouge('Status', 'No note was deleted');
      return;
    }

    //Case 2 : User trying to delete old Note with valid id
    int result = await databaseHelper.deleteNote(note.id);
    if (result != 0) {
      _showAlertDialouge('Status', 'Note Deleted Successfullt');
    } else {
      _showAlertDialouge('Status', 'Error while deleteing note.');
    }
  }
}
