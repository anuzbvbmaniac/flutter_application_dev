import 'package:flutter/material.dart';
import 'package:todolist/widgets/custom_date_time_picker.dart';
import 'package:todolist/widgets/custom_textfield.dart';
import 'package:todolist/widgets/custon_modal_action_button.dart';

class AddEventPage extends StatefulWidget {
  _AddEventPageState createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  String _selectedDate = 'Pick Date';
  String _selectedTime = 'Pick Time';

  Future _pickDate() async {
    DateTime datepick = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime.now().add(Duration(days: -365)),
        lastDate: new DateTime.now().add(Duration(days: 365)));

    if (datepick != null)
      setState(() {
        _selectedDate = datepick.toString();
      });
  }

  Future _pickTime() async {
    TimeOfDay timepick = await showTimePicker(
      context: context,
      initialTime: new TimeOfDay.now(),
    );
    if (timepick != null) {
      setState(() {
        _selectedTime = timepick.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Center(
            child: Text(
              "Add New Event",
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
            labeltext: "Enter Event Name",
          ),
          SizedBox(
            height: 12.0,
          ),
          CustomTextField(
            labeltext: "Enter Description",
          ),
          SizedBox(
            height: 12.0,
          ),
          CustomDateTimePicker(
            onPressed: _pickDate,
            icon: Icons.date_range,
            value: _selectedDate,
          ),
          CustomDateTimePicker(
            onPressed: _pickTime,
            icon: Icons.access_time,
            value: _selectedTime,
          ),
          SizedBox(
            height: 24.0,
          ),
          CustomModalActionButton(
            onClose: () {
              Navigator.of(context).pop();
            },
            onSave: () {},
          ),
        ],
      ),
    );
  }
}
