import 'package:flutter/material.dart';

import '../bgAtas/bgatas.dart';

class NormalList extends StatefulWidget {
  String mainTitle;
  Icon prefixTextFieldIcon;
  String hintTextField;
  String subtitleText;
  Widget generatorChild;

  NormalList(
      {@required this.mainTitle,
      this.prefixTextFieldIcon,
      this.hintTextField,
      @required this.subtitleText,
      @required this.generatorChild});

  @override
  _NormalListState createState() => _NormalListState();
}

class _NormalListState extends State<NormalList> {
  String mainTitle;
  String hintTextField;
  String subtitleText;
  Icon prefixTextFieldIcon;
  Widget generatorChild;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.mainTitle = widget.mainTitle;
    this.hintTextField = widget.hintTextField;
    this.prefixTextFieldIcon = widget.prefixTextFieldIcon;
    this.subtitleText = widget.subtitleText;
    this.generatorChild = widget.generatorChild;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFE5E6E6),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            BgAtas(
              title: this.mainTitle,
            ),
            Container(
              transform: Matrix4.translationValues(0, -30, 0),
              width: MediaQuery.of(context).size.width * .9,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 9,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),

//              child: TextField(
//                style: TextStyle(
//                  fontSize: 14,
//                  height: .8
//                ),
//                decoration: InputDecoration(
//                  prefixIcon: prefixTextFieldIcon,
//                    focusedBorder: border,
//                    border: border,
//                    enabledBorder: border,
//                    filled: true,
//                    fillColor: Colors.white,
//                    hintText: hintTextField),
//              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .05,
                  right: MediaQuery.of(context).size.width * .05,
                  bottom: 10),
              child: Text(subtitleText),
            ),
            Container(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .05,
                  right: MediaQuery.of(context).size.width * .05,
                ),
                child: generatorChild)
          ],
        ),
      ),
    );
  }

  final border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(3)),
      borderSide: BorderSide(color: Colors.white, width: 0.0));
}
