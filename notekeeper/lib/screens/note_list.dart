import 'package:flutter/material.dart';
import 'dart:async';
import 'package:notekeeper/model/note.dart';
import 'package:notekeeper/utils/databse_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'note_details.dart';

class NoteList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _NoteListState();
  }

}

class _NoteListState extends State<NoteList> {

  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note> noteList;
  int count = 0;

  @override
  Widget build(BuildContext context) {

    if(noteList == null) {
      noteList = List<Note>();
      updateListView();
    }


    return Scaffold(
       appBar: AppBar(
         title: Text("Notes"),
       ),
       body: getNoteListView(),
       floatingActionButton: FloatingActionButton(
         onPressed: () {
           debugPrint("FAB clicked!");
           navigateToDetail(Note('', '', 2), 'Add Note');
         },
         tooltip: "Add Note",
         child: Icon(Icons.add),
       ),
    );
  }

  ListView getNoteListView() {
    // Theming Title, Subtitle
    TextStyle titleStyle = Theme.of(context).textTheme.subhead;

    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: getPriorityColor(this.noteList[position].priority),
              child: getPriorityIcon(this.noteList[position].priority)
            ),
            title: Text(
              this.noteList[position].title,
              style: titleStyle,
            ),
            subtitle: Text(
              this.noteList[position].date,
            ),
            trailing: GestureDetector(
              child: Icon(
                Icons.delete, color: Colors.redAccent,
              ),
              onTap: () {
                _delete(context, noteList[position]);
              },
            ),
            onTap: () {
              debugPrint("List View Tapped");
              navigateToDetail(this.noteList[position], "Edit Note");
            },
          )
        );
      },
    );
  }

  //return priority color
  Color getPriorityColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.red;
        break;
      case 2:
        return Colors.yellow;
        break;

      default:
        return Colors.yellow;
    }
  }

  //return priority icon
  Icon getPriorityIcon(int priority) {
    switch (priority) {
      case 1:
        return Icon(Icons.play_arrow);
        break;
      case 2:
        return Icon(Icons.keyboard_arrow_right);
        break;

      default:
        return Icon(Icons.keyboard_arrow_right);
    }
  }

  void _delete(BuildContext context, Note note) async {
    int result = await databaseHelper.deleteNote(note.id);
    if(result != 0) {
      _showSnackbar(context, "Note Deleted Successfully");
      updateListView();
    }
  }

  void _showSnackbar(BuildContext context, String msg) {
    final snackBar = SnackBar(content: Text(msg));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void navigateToDetail(Note note, String title) async {
    bool result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NoteDetails(note, title);
    }));

    if(result == true) {
      updateListView();
    }

  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Note>> noteListFuture = databaseHelper.getNoteList();
      
      noteListFuture.then((noteList) {
        setState(() {
          this.noteList = noteList;
          this.count = noteList.length;
        });
      });

    });
  }
}