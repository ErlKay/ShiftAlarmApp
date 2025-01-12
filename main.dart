
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShiftScheduler(),
    );
  }
}

class ShiftScheduler extends StatefulWidget {
  @override
  _ShiftSchedulerState createState() => _ShiftSchedulerState();
}

class _ShiftSchedulerState extends State<ShiftScheduler> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2023),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shift Scheduler'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Selected Date: ${selectedDate.toLocal()}"),
          Text("Selected Time: ${selectedTime.format(context)}"),
          ElevatedButton(
            onPressed: () => _selectDate(context),
            child: Text('Select Date'),
          ),
          ElevatedButton(
            onPressed: () => _selectTime(context),
            child: Text('Select Time'),
          ),
          ElevatedButton(
            onPressed: () {
              // Save the selected shift to backend
            },
            child: Text('Save Shift'),
          ),
        ],
      ),
    );
  }
}
