import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ServiceCalendarWidget extends StatefulWidget {
  const ServiceCalendarWidget({super.key});

  @override
  _ServiceCalendarWidgetState createState() => _ServiceCalendarWidgetState();
}

class _ServiceCalendarWidgetState extends State<ServiceCalendarWidget> {
  // CalendarController _controller;

  @override
  void initState() {
    super.initState();
    // _controller = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        TableCalendar(
          calendarFormat: CalendarFormat.month,
          calendarStyle: const CalendarStyle(
              todayTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                  color: Colors.white)),
          headerStyle: HeaderStyle(
            formatButtonDecoration: BoxDecoration(
              color: Colors.brown,
              borderRadius: BorderRadius.circular(22.0),
            ),
            formatButtonTextStyle: const TextStyle(color: Colors.white),
            formatButtonShowsNext: false,
          ),
          startingDayOfWeek: StartingDayOfWeek.monday,
          firstDay: DateTime(2023),
          focusedDay: DateTime.now(),
          lastDay: DateTime.now(),
          /*onDaySelected: (date, events) {
            print(date.toUtc());
          },*/
        ),
      ],
    );
  }
}
