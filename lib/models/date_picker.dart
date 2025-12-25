import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  final ValueChanged<DateTime> onDateSelected;

  const DatePicker({required this.onDateSelected, super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  final TextEditingController _dateCtrl = TextEditingController();
  DateTime? selectedDate;

  @override
  void dispose() {
    _dateCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: TextField(
        controller: _dateCtrl,
        readOnly: true,
        decoration: const InputDecoration(
          labelText: 'Select Date',
          border: OutlineInputBorder(),
          suffixIcon: Icon(Icons.calendar_today),
        ),
        onTap: () async {
          final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
          );
          if (picked != null) {
            setState(() {
              widget.onDateSelected(picked);
              selectedDate = picked;
              _dateCtrl.text = '${picked.year}-${picked.month}-${picked.day}';
            });
          }
        },
      ),
    );
  }
}
