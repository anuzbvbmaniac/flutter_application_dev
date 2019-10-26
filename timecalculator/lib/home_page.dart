import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  var _formKey = GlobalKey<FormState>();

  TextEditingController iniHourController = TextEditingController();
  TextEditingController iniMinutesController = TextEditingController();
  TextEditingController finHourController = TextEditingController();
  TextEditingController finMinutesController = TextEditingController();

  var displayResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Time Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                getImageAsset(),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        controller: iniHourController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelStyle: Theme.of(context).textTheme.title,
                            labelText: "Initial Hour",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            errorStyle: TextStyle(color: Colors.red)),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Required";
                          }
                          if (int.parse(value) > 24) {
                            return "Hour cannont exceed 24";
                          }
                          // Pattern pattern = r'/^[0-9]$/';
                          // RegExp regex = new RegExp(pattern);
                          // if(!regex.hasMatch(value)) {
                          //   return "Enter Valid Inputs";
                          // }
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: iniMinutesController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelStyle: Theme.of(context).textTheme.title,
                            labelText: "Initial Minutes",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0))),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Required";
                          }
                        },
                      ),
                    ),
                  ],
                ),
                Text(
                  "-",
                  style: TextStyle(
                    fontSize: 40.0,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        controller: finHourController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelStyle: Theme.of(context).textTheme.title,
                            labelText: "Final Hour",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0))),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Required";
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: finMinutesController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelStyle: Theme.of(context).textTheme.title,
                            labelText: "Final Minutes",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0))),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Required";
                          }
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.0,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).accentColor,
                        textColor: Colors.white,
                        child: Text(
                          "CALCULATE",
                          textScaleFactor: 1.2,
                        ),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(8.0)),
                        padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                        onPressed: () {
                          setState(() {
                            if (_formKey.currentState.validate()) {
                              this.displayResult = _calaculateTimeDifferences();
                            }
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Expanded(
                      child: OutlineButton(
                        borderSide: BorderSide(color: Colors.blue, width: 3),
                        textColor: Theme.of(context).accentColor,
                        child: Text(
                          "RESET",
                          textScaleFactor: 1.2,
                        ),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(8.0)),
                        padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
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
                  padding: EdgeInsets.all(5.0 * 2),
                  child: Text(
                    this.displayResult,
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Developed By"),
                        Text(
                          " Stylus Technology.",
                          style:
                              TextStyle(color: Color.fromRGBO(249, 187, 31, 1)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage('images/clock.png');
    Image image = Image(
      image: assetImage,
      width: 100.0,
      height: 100.0,
    );
    return Container(
      child: image,
      margin: EdgeInsets.all(5.0 * 5.0),
    );
  }

  String _calaculateTimeDifferences() {
    //get the string value to int
    int iniHour = int.parse(iniHourController.text);
    int iniMin = int.parse(iniMinutesController.text);
    int finHour = int.parse(finHourController.text);
    int finMin = int.parse(finMinutesController.text);

    // if (finHour != iniHour && iniMin > finMin) {
    //   finHour = finHour - 1;
    //   finMin = finMin + 60;

    //   //calculation here
    //   int resultHour = finHour - iniHour;
    //   int resultMin = finMin - iniMin;

    //   String result = "Output is $resultHour Hours : $resultMin Minutes";
    //   return result;

    // } else if (finHour == iniHour && finMin < iniMin) {
    //     return "Invalid Numbers, Please Check the input.";
    // } else if (iniHour > 12) {

    //   int resultHour = iniHour - finHour;
    //   int resultMin = finMin - iniMin;

    //   String result = "Output is $resultHour Hours : $resultMin Minutes";
    //   return result;

    // } else {
    //   //calculation here
    //   int resultHour = finHour - iniHour;
    //   int resultMin = finMin - iniMin;

    //   String result = "Output is $resultHour Hours : $resultMin Minutes";
    //   return result;
    // }

    //easysurf logic
    int time1 = (iniHour * 60) + iniMin;
    int time2 = (finHour * 60) + finMin;

    if(time1 > time2) {
      finHour = finHour + 24;
      time2 = (finHour * 60) + finMin;
    }

    int time3 = time2 - time1;
    int time4 = (time3/60).toInt();
    int time5 = time3 - (time4 * 60);



    return " Output is $time4 Hours : $time5 Minutes";

  //   int h1 = int.parse(iniHourController.text);
  //   int m1 = int.parse(iniMinutesController.text);
  //   int h2 = int.parse(finHourController.text);
  //   int m2 = int.parse(finMinutesController.text);

	//   int t1= (h1*60) + m1;
	//   int t2= (h2 * 60) + m2;
	//   if (t1 > t2) {
  //     h2= h2 + 24;
  //     t2= (h2 * 60) + m2;
	// 	}
	//   int t3= t2 - t1;
	//   String t4= (t3/60).toStringAsFixed(0);
	//   int t5= t3-(int.parse(t4) * 60);

  //  return "$t4  $t5";


  }

  void _reset() {
    iniHourController.text = "";
    iniMinutesController.text = "";
    finHourController.text = "";
    finMinutesController.text = "";
    displayResult = "";
  }
}
