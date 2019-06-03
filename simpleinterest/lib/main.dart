import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Simple Interest Calculator",
      home: SIForm(),
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.indigo,
        accentColor: Colors.indigoAccent,
      )
    )
  );
}

class SIForm extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SIFormState();
  }
}

class _SIFormState extends State<SIForm>{

  var _currency = ['Rupees', 'Dollars', 'Pounds'];
  final _minimumpadding = 5.0;

  var _currentItemSelected = "";

  @override
  void initState() { 
    super.initState();
    _currentItemSelected = _currency[0];    
  }

  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  var displayResult = "";

  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = Theme.of(context).textTheme.title;

    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Simple Interest Calculator"),
      ),

      body: Container(
        margin: EdgeInsets.all(_minimumpadding * 2),
        child: ListView(
          children: <Widget>[

            getImageAsset(),

            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Principal",
                labelStyle: textStyle,
                hintText: "Please insert Principal Amount.",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0)
                )
              ),
              style: textStyle,
              controller: principalController,
            ),
            SizedBox(height: 16.0,),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Rate of Interest",
                hintText: "Please insert Interest Rate(%).",
                labelStyle: textStyle,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0)
                )
              ),
              style: textStyle,
              controller: roiController,
            ),

            SizedBox(height: 16.0,),

            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    style: textStyle,
                    decoration: InputDecoration(
                      labelText: "Time",
                      hintText: "Please insert Time(Years).",
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)
                      )
                    ),
                    controller: timeController,
                  ),
                ),

                SizedBox(width: 12.0),

                Expanded(
                  child: DropdownButton<String>(
                    items: _currency.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,),
                      );
                    }).toList(),

                    value: _currentItemSelected,
                    onChanged: (String newValueSelected) {
                      _onDropdownItemSelected(newValueSelected);
                    },
                  ),
                ),

              ],
            ),

            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    color: Theme.of(context).accentColor,
                    textColor: Theme.of(context).primaryColorDark,
                    child: Text("Calculate", textScaleFactor: 1.5,),
                    onPressed: () {
                      setState(() {
                        this.displayResult = _calculateTotalReturns();
                      });
                    },
                  ),
                ),

                SizedBox(height: 64.0,),

                Expanded(
                  child: RaisedButton(
                    color: Theme.of(context).primaryColorDark,
                    textColor: Theme.of(context).primaryColorLight,
                    child: Text("Reset", textScaleFactor: 1.5,),
                    onPressed: () {
                      setState(() {
                       _reset(); 
                      });
                    },
                  ),
                ),

              ],
            ),

            Padding(
              padding: EdgeInsets.all(_minimumpadding * 2),
              child: Text(this.displayResult, style: textStyle,),
            )

          ],
        ),
      ),
    );
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage('images/budget.png');
    Image image = Image(image: assetImage, width: 125.0, height: 125.0,);
    return Container(child: image, margin: EdgeInsets.all(_minimumpadding * 10.0),);
  }

  void _onDropdownItemSelected(String newValueSelected) {

    setState(() {
      this._currentItemSelected = newValueSelected;
    });

  }

  String _calculateTotalReturns() {
    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double time = double.parse(timeController.text);

    double totalAmountPayable = principal + (principal * roi * time) / 100;

    String result = "After $time years, your investment will be worth of $totalAmountPayable $_currentItemSelected.";
    return result;
  }

  void _reset() {
    principalController.text = "";
    roiController.text = "";
    timeController.text = "";
    displayResult = "";
    _currentItemSelected = _currency[0];
  }
 
}