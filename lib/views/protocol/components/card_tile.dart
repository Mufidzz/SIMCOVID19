import 'package:flutter/material.dart';

class ProtocolCardTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      color: Colors.white,
      margin: EdgeInsets.only(left: 0, right: 0, bottom: 10),
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            color: Colors.grey,
          ),
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                RichText(
                  text: TextSpan(style: TextStyle(color: Colors.black),text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore'),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                RaisedButton(
                  onPressed: () {  },
                  color: Colors.blue[100],
                  child: Text("Donasi ?"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
