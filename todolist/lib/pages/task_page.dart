import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todolist/model/database.dart';
import 'package:todolist/model/todo.dart';
import 'package:todolist/widgets/custom_button.dart';

class TaskPage extends StatefulWidget {
  _TaskPageState createState() => _TaskPageState();
}

class Task {
  final String task;
  final bool isComplete;
  const Task(this.task, this.isComplete);
}

final List<Task> _taskList = [
  new Task("Call Romisha for Meeting.", false),
  new Task("Fix NADA Jeep 3D Stall Ceiling.", false),
  new Task("Meet Rohit for Ecommerce Website.", false),
  new Task("Remind Sandesh to bring Laptop.", false),
  new Task("Have coffee with Sabin..", true),
  new Task("Complete YAMAHA 3D Stall Design.", true),
];

class _TaskPageState extends State<TaskPage> {
  Database provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<Database>(context);

    return StreamProvider.value(
      value: provider.getTodoByType(TodoType.TYPE_TASK.index),
      child: Consumer<List<TodoData>>(
        builder: (context, _datalist, child) {
          return _datalist == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(0),
                  itemCount: _datalist.length,
                  itemBuilder: (context, index) {
                    return _datalist[index].isComplete
                        ? _taskCompleted(_datalist[index])
                        : _taskInComplete(_datalist[index]);
                  },
                );
        },
      ),
    );
  }

  Widget _taskInComplete(TodoData data) {
    return InkWell(
      onTap: () {
        //todo: complete the task
        showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "Confirm Task",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      Text(data.task),
                      SizedBox(
                        height: 24.0,
                      ),
                      Text(new DateFormat("dd-MM-yyyy").format(data.date)),
                      SizedBox(
                        height: 24.0,
                      ),
                      CustomButton(
                        buttonText: "Complete",
                        onPressed: () {
                          //todo: implement database request to complete task
                          provider
                              .completeTodoEntries(data.id)
                              .whenComplete(() => Navigator.of(context).pop());
                        },
                        color: Theme.of(context).accentColor,
                        textColor: Colors.white,
                      )
                    ],
                  ),
                ),
              );
            });
      },
      onLongPress: () {
        //todo: to delete the task
        showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "Delete Task",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      Text(data.task),
                      SizedBox(
                        height: 24.0,
                      ),
                      Text(new DateFormat("dd-MM-yyyy").format(data.date)),
                      SizedBox(
                        height: 24.0,
                      ),
                      CustomButton(
                        buttonText: "Delete",
                        onPressed: () {
                          //todo: implement database request to complete task
                          provider
                              .deleteTodoEntries(data.id)
                              .whenComplete(() => Navigator.of(context).pop());
                        },
                        color: Theme.of(context).accentColor,
                        textColor: Colors.white,
                      )
                    ],
                  ),
                ),
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.radio_button_unchecked,
              color: Theme.of(context).accentColor,
              size: 20.0,
            ),
            SizedBox(
              width: 28.0,
            ),
            Text(data.task)
          ],
        ),
      ),
    );
  }

  Widget _taskCompleted(TodoData data) {
    return Container(
      foregroundDecoration: BoxDecoration(color: Color(0x60FDFDFD)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.radio_button_checked,
              color: Theme.of(context).accentColor,
              size: 20.0,
            ),
            SizedBox(
              width: 28.0,
            ),
            Text(data.task)
          ],
        ),
      ),
    );
  }
}
