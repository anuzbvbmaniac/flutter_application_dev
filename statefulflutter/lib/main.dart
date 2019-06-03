import 'package:flutter/material.dart';

void main() {
  
  runApp(
    MaterialApp(
      title: "Stateful Application",
      home: FavouriteProgrammingLanguage(),
    )
  );
}

class FavouriteProgrammingLanguage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _FavouriteProgrammingLanguageState();
  }
  
}

class _FavouriteProgrammingLanguageState extends State<FavouriteProgrammingLanguage> {

  String nameProgrammingLanguage;
  var _programmingLanguage = ['Java', 'PHP', 'Ruby', 'HTML/CSS', 'Others'];
  var _currentLanguageSelected = 'Java';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stateful Application"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(      
          children: <Widget>[
            TextField(
              onSubmitted: (String userInput) {
                setState(() {
                  nameProgrammingLanguage = userInput; 
                });

              },
            ),
            DropdownButton<String>(
              items: _programmingLanguage.map((String dropDownStringItem) {
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(dropDownStringItem),
                );
              }).toList(),
              onChanged: (String newValueSelected) {
                _onDropdownSelected(newValueSelected);
              },
              value: _currentLanguageSelected,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Your favourite Programming Language is $nameProgrammingLanguage.",
                style: TextStyle(
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onDropdownSelected(String newValueSelected) {
    setState(() {
      this._currentLanguageSelected = newValueSelected; 
    });
  }
}