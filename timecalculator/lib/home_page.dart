import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Time Calculator"),
      ),
      body: new Container(
        padding: const EdgeInsets.all(40.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new TextField(
                keyboardType: TextInputType.datetime,
                decoration: new InputDecoration(
                    hintText: "Enter Initial Time"),
                ),
            new TextField(
                keyboardType: TextInputType.datetime,
                decoration: new InputDecoration(hintText: "Enter Final Time")),
            new Padding(padding: const EdgeInsets.only(top: 20.0)),
            new MaterialButton(
              child: new Text("CALCULATE"),
              textColor: Colors.white,
              color: Colors.redAccent,
              onPressed: () {},
            ),
            new Padding(padding: const EdgeInsets.only(bottom: 20.0)),
            new Text("0utput : ",
              style: new TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),

      ),
    );
  }
}
