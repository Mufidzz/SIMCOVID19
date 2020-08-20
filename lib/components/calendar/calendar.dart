import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;

class Calendar extends StatefulWidget {
  @override
  State createState() {
    return _CalendarState();
  }
}

class _CalendarState extends State<Calendar> {
  DateTime _currentDate;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        child: Stack(
          children: <Widget>[
            Positioned(
                child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 54,
                  color: Color(0xffF5C0C0),
                ),
                Container(
                  width: double.infinity,
                  height: 54,
                  color: Color(0xffDBDBDB),
                ),
              ],
            )),
            CalendarCarousel<Event>(
              onDayPressed: (DateTime date, List<Event> events) {
                this.setState(() => _currentDate = date);
              },
              weekendTextStyle: TextStyle(color: Colors.red),
              height: 420.0,
              daysHaveCircularBorder: false,
              selectedDateTime: _currentDate,
              staticSixWeekFormat: true,
              headerTextStyle: TextStyle(color: Colors.black, fontSize: 20),
              iconColor: Colors.black,
              weekdayTextStyle: TextStyle(color: Colors.black, fontSize: 14),
            ),
          ],
        ));
  }
}
