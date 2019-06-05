import 'package:flutter/material.dart';

class NoteDetails extends StatefulWidget {

  String appBarTitle;
  NoteDetails(this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return _NoteDetailsState(this.appBarTitle);
  }
  
}

class _NoteDetailsState extends State<NoteDetails> {

  static var _priorities = ['High', "Low"];
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  //for title change
  String appBarTitle;
  //constructor
  _NoteDetailsState(this.appBarTitle);

  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = Theme.of(context).textTheme.title;

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
            }
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 16.0, right: 8.0, left: 8.0),
          child: ListView(
            children: <Widget>[
              ListTile(
                title: DropdownButton(
                  items: _priorities.map((String dropDownStringItems) {
                    return DropdownMenuItem<String> (
                      value: dropDownStringItems,
                      child: Text(dropDownStringItems),  
                    );
                  }).toList(),
                  style: textStyle,
                  value: "Low",
                  onChanged: (valueSelectedByUser) {
                    setState(() {
                      debugPrint("User selected $valueSelectedByUser");
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
                  },
                  decoration: InputDecoration(
                    labelStyle: textStyle,
                    labelText: "Title",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)
                    )
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: TextField(
                  controller: descController,
                  style: textStyle,
                  onChanged: (value) {
                    debugPrint("Changes In Text Field");
                  },
                  decoration: InputDecoration(
                    labelStyle: textStyle,
                    labelText: "Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)
                    )
                  ),
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
                          setState((){
                            debugPrint("Save Button Clicked");
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
                          setState((){
                            debugPrint("Save Button Clicked");
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
    );
  }

  void moveToLastScreen() {
    Navigator.pop(context);
  }

}