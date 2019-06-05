import 'package:flutter/material.dart';

import 'note_details.dart';

class NoteList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _NoteListState();
  }

}

class _NoteListState extends State<NoteList> {

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Notes"),
       ),
       body: getNoteListView(),
       floatingActionButton: FloatingActionButton(
         onPressed: () {
           debugPrint("FAB clicked!");
           navigateToDetail("Add Note");
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
              backgroundColor: Colors.yellow,
              child: Icon(Icons.keyboard_arrow_right),
            ),
            title: Text(
              "Dummy Text 1",
              style: titleStyle,
            ),
            subtitle: Text(
              "Dummy Date here"
            ),
            trailing: Icon(
              Icons.delete, color: Colors.redAccent,
            ),
            onTap: () {
              debugPrint("List View Tapped");
              navigateToDetail("Edit Note");
            },
          )
        );
      },
    );
  }

  void navigateToDetail(String title) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NoteDetails(title);
    }));
  }


}