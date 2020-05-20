import 'package:flutter/material.dart';

class Bio extends StatelessWidget {
  final double shrinkOffset, expandedHeight;

  Bio({Key key, @required this.shrinkOffset, @required this.expandedHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        'Buleleng, Bali',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      )
                    ],
                  ),
                ),
                Text(
                  'Hari ke-27 PSBB',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
            SizedBox(
              height: 22,
            ),
            Text(
              'Selamat Pagi',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Yusril Hasan',
              style: TextStyle(color: Colors.white, fontSize: 22),
            )
          ],
        ),
      ),
    );
  }
}
