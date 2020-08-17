import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Bio extends StatelessWidget {
  final double shrinkOffset, expandedHeight;
  String username, asal;
  int hari;

  Bio(
      {Key key,
      @required this.shrinkOffset,
      @required this.expandedHeight,
      @required this.username,
      @required this.asal,
      @required this.hari
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('HH').format(now);

    return Opacity(
      opacity: (1 - shrinkOffset / expandedHeight),
      child: Container(
        padding: EdgeInsets.only(top: 32, left: 22, right: 22),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        asal,
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      )
                    ],
                  ),
                ),
                Text(
                  'Hari ke-$hari PSBB',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
            SizedBox(
              height: 22,
            ),
            Text(
              makeGreetingFromNow(formattedDate),
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              username.toUpperCase(),
              style: TextStyle(color: Colors.white, fontSize: 22),
            )
          ],
        ),
      ),
    );
  }

  String makeGreetingFromNow(String formattedDate) {
    String greeting = "Selamat ";
    int format = int.parse(formattedDate);

    if (format >= 0 && format <= 10) {
      greeting += "Pagi";
    } else if (format > 10 && format <= 14) {
      greeting += "Siang";
    } else if (format > 14 && format <= 18) {
      greeting += "Sore";
    } else {
      greeting += "Malam";
    }

    return greeting;
  }
}
