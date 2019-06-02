import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Long List View",
    home: Scaffold(
      appBar: AppBar(
        title: Text("Long Text"),
      ),
      body: getListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('FAB Clicked');
        },
        child: Icon(Icons.add),
        tooltip: "Add one more Item",
      ),
    ),
  ));
}

// create items for list View
List<String> getListElements() {
  var items = List<String>.generate(1000, (counter) => "Item $counter");
  return items;
}

// get list items and add those to ListTile as an widget
Widget getListView() {

  var listItems = getListElements(); 

  var listView = ListView.builder(
    itemBuilder: (context, index) {
      return ListTile(
        leading: Icon(Icons.arrow_right),
        title: Text(listItems[index]),
        subtitle: Text("This is List ${listItems[index]}"),
        onTap: () {
          debugPrint('${listItems[index]} was clicked!');
          showSanckBar(context, listItems[index]);
        },
      );
    }
  );
  return listView;
}

void showSanckBar(BuildContext context, String item) {
  var snackBar = SnackBar(
    content: Text("You clicked $item"),
    action: SnackBarAction(
      onPressed: () {
        debugPrint("Undo Performance!");
      },
      label: "Undo",
    )
  );
  Scaffold.of(context,).showSnackBar(snackBar);
}