import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDay = DateTime(2025, 1, 1); // Début en Janvier 2025
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendrier 2025"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime(2025, 1, 1),
            lastDay: DateTime(2025, 12, 31),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            headerStyle: HeaderStyle(
              formatButtonVisible: true,
              titleCentered: true,
            ),
            calendarStyle: CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
            ),
          ),
          SizedBox(height: 20),
          _selectedDay != null
              ? Text(
            "Jour sélectionné : ${_selectedDay!.day}/${_selectedDay!.month}/${_selectedDay!.year}",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )
              : Text("Sélectionnez un jour"),
        ],
      ),
    );
  }
}
