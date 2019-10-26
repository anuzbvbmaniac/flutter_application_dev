import 'package:flutter/material.dart';
import 'package:todolist/widgets/custom_icondecoration.dart';

class EventPage extends StatefulWidget {
  _EventPageState createState() => _EventPageState();
}

class Event {
  final String time;
  final String task;
  final String desc;
  final bool isComplete;

  const Event(this.time, this.task, this.desc, this.isComplete);
}

final List<Event> _eventList = [
  new Event("08:00", "Have Coffee with Anuz", "Personal", true),
  new Event("10:00", "Meet Bishwas Karki", "Personal", true),
  new Event("12:00", "Call Romisha for Assignments.", "Personal", false),
  new Event("14:00", "Complete Flutter Application", "Personal", false),
  new Event("16:00", "Fix Onboarding Screen.", "Personal", false),
  new Event("18:00", "Setup User Focus group.", "Personal", false),
  new Event("14:00", "Complete Flutter Application", "Personal", false),
  new Event("16:00", "Fix Onboarding Screen.", "Personal", false),
  new Event("18:00", "Setup User Focus group.", "Personal", false),
];

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    double iconSize = 20;
    return ListView.builder(
      itemCount: _eventList.length,
      padding: const EdgeInsets.all(0),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child: Row(
            children: <Widget>[
              _lineStyle(context, iconSize, index, _eventList.length,
                  _eventList[index].isComplete),
              _displayTime(_eventList[index].time),
              _displayContent(_eventList[index])
            ],
          ),
        );
      },
    );
  }

  Expanded _displayContent(Event event) {
    return Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 12.0),
                child: Container(
                  padding: const EdgeInsets.all(14.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0x20000000),
                            blurRadius: 5,
                            offset: Offset(0, 3))
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        event.task,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Text(event.desc),
                    ],
                  ),
                ),
              ),
            );
  }

  Container _displayTime(String time) {
    return Container(
        width: 80,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(time),
        ));
  }

  Container _lineStyle(BuildContext context, double iconSize, int index,
      int listLength, bool isCompelete) {
    return Container(
      decoration: CustomIconDecoration(
          iconSize: iconSize,
          lineWidth: 1,
          firstData: index == 0 ?? true,
          lastData: index == listLength - 1 ?? true),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 1), color: Color(0x10000000), blurRadius: 1)
            ]),
        child: Icon(
          isCompelete
              ? Icons.fiber_manual_record
              : Icons.radio_button_unchecked,
          size: iconSize,
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
