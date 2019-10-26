import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todolist/model/database.dart';
import 'package:todolist/model/todo.dart';
import 'package:todolist/widgets/custom_date_time_picker.dart';
import 'package:todolist/widgets/custom_textfield.dart';
import 'package:todolist/widgets/custon_modal_action_button.dart';

class AddTaskPage extends StatefulWidget {
  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  DateTime _selectedDate = DateTime.now();
  final _textTaskController = TextEditingController();

  // String _selectedTime = 'Pick Time';

  Future _pickDate() async {
    DateTime datepick = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime.now().add(Duration(days: -365)),
        lastDate: new DateTime.now().add(Duration(days: 365)));

    if (datepick != null)
      setState(() {
        _selectedDate = datepick;
      });
  }

  // Future _pickTime() async {
  //   TimeOfDay timepick = await showTimePicker(
  //     context: context,
  //     initialTime: new TimeOfDay.now(),
  //   );
  //   if (timepick != null) {
  //     setState(() {
  //       _selectedTime = timepick.toString();
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Database>(context);
    _textTaskController.clear();
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Center(
            child: Text(
              "Add New task",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 24.0,
          ),
          CustomTextField(
            labeltext: "Enter task Name",
            controller: _textTaskController,
          ),
          SizedBox(
            height: 12.0,
          ),
          CustomDateTimePicker(
            onPressed: _pickDate,
            icon: Icons.date_range,
            value: new DateFormat("dd-MM-yyyy").format(_selectedDate),
          ),
          SizedBox(
            height: 24.0,
          ),
          CustomModalActionButton(
            onClose: () {
              Navigator.of(context).pop();
            },
            onSave: () {
              if (_textTaskController.text == "") {
                print("Data not found");
              } else {
                provider
                    .insertTodoEntries(new TodoData(
                        date: _selectedDate,
                        time: DateTime.now(),
                        isComplete: false,
                        task: _textTaskController.text,
                        description: "",
                        todoType: TodoType.TYPE_TASK.index,
                        id: null))
                    .whenComplete(() => Navigator.of(context).pop());
              }
            },
          ),
        ],
      ),
    );
  }
}
