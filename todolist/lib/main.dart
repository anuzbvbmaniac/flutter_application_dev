import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todolist/model/database.dart';
import 'package:todolist/pages/add_event_page.dart';
import 'package:todolist/pages/add_task_page.dart';
import 'package:todolist/pages/event_page.dart';
import 'package:todolist/pages/task_page.dart';
import 'package:todolist/widgets/custom_button.dart';
// import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //     SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Database>(
          builder: (_) => Database(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme:
            ThemeData(fontFamily: 'Montserrat', primarySwatch: Colors.orange),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _pageController = PageController();
  double currentPage = 0;

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    String todaysDate = DateFormat('d').format(date);
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page;
      });
    });

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Theme.of(context).accentColor,
            height: 35.0,
          ),
          Positioned(
            right: 0,
            child: Text(
              todaysDate,
              style: TextStyle(
                  fontSize: 200,
                  color: Color(0x10000000),
                  letterSpacing: -15.0),
            ),
          ),
          Positioned(
            right: 10,
            top: 83,
            child: Text(
              "July",
              style: TextStyle(
                  fontSize: 32,
                  color: Color(0x50000000),
                  fontWeight: FontWeight.bold),
            ),
          ),
          _mainContent(context),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  child: currentPage == 0 ? AddTaskPage() : AddEventPage(),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                );
              });
        },
        tooltip: 'Add new task',
        elevation: 1,
        icon: Icon(
          Icons.add,
          color: Colors.white,
        ),
        label: Text(
          "Add a task",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: AutomaticNotchedShape(
            RoundedRectangleBorder(), StadiumBorder(side: BorderSide())),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }

  Widget _mainContent(BuildContext context) {
    DateTime date = DateTime.now();
    String todaysDay = DateFormat('EEEE').format(date);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 60.0,
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            todaysDay,
            style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: _button(context),
        ),
        Expanded(
            child: PageView(
          controller: _pageController,
          children: <Widget>[TaskPage(), EventPage()],
        ))
      ],
    );
  }

  Widget _button(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: CustomButton(
            onPressed: () {
              _pageController.previousPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.bounceIn);
            },
            buttonText: "TASKS",
            color: currentPage < 0.5
                ? Theme.of(context).accentColor
                : Colors.white,
            textColor: currentPage < 0.5
                ? Colors.white
                : Theme.of(context).accentColor,
            borderColor: currentPage < 0.5
                ? Colors.transparent
                : Theme.of(context).accentColor,
          ),
        ),
        SizedBox(width: 32.0),
        Expanded(
          child: CustomButton(
            onPressed: () {
              _pageController.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.bounceIn);
            },
            buttonText: "EVENTS",
            color: currentPage > 0.5
                ? Theme.of(context).accentColor
                : Colors.white,
            textColor: currentPage > 0.5
                ? Colors.white
                : Theme.of(context).accentColor,
            borderColor: currentPage > 0.5
                ? Colors.transparent
                : Theme.of(context).accentColor,
          ),
        ),
      ],
    );
  }
}
