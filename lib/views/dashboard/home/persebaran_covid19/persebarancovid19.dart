import 'package:flutter/material.dart';

class PersebaranCovid19 extends StatefulWidget {
  @override
  _PersebaranCovid19State createState() => _PersebaranCovid19State();
}

class _PersebaranCovid19State extends State<PersebaranCovid19> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.all(16),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Persebaran COVID-19',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            '19 Mei 2020',
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(
            height: 26,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Nasional',
                style: TextStyle(fontSize: 16),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 20,
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          PersebaranShape(context),
          SizedBox(
            height: 26,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Provinsi Bali',
                style: TextStyle(fontSize: 16),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 20,
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          PersebaranShape(context),
          SizedBox(
            height: 26,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Kabupaten Buleleng',
                style: TextStyle(fontSize: 16),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 20,
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          PersebaranShape(context),
        ],
      ),
    );
  }
}

Widget PersebaranShape(BuildContext context){
  return Container(
    width: double.infinity,
    height: MediaQuery.of(context).size.width / 3,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width / 3.5,
          padding: EdgeInsets.only(top: 16, bottom: 16),
          decoration: BoxDecoration(
            color: Color(0xFFF8D6AE),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'Positif',
                style: TextStyle(
                  color: Color(0xFF484848),
                ),
              ),
              Text(
                '12.438',
                style:
                TextStyle(color: Color(0xFFF8992B), fontSize: 16),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                '+367 Kasus',
                style: TextStyle(
                  color: Color(0xFF484848),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 3.5,
          padding: EdgeInsets.only(top: 16, bottom: 16),
          decoration: BoxDecoration(
            color: Color(0xFFC7F2CD),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'Sembuh',
                style: TextStyle(
                  color: Color(0xFF484848),
                ),
              ),
              Text(
                '12.438',
                style:
                TextStyle(color: Color(0xFF5AD06D), fontSize: 16),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                '12.68% Kasus',
                style: TextStyle(
                  color: Color(0xFF484848),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 3.5,
          padding: EdgeInsets.only(top: 16, bottom: 16),
          decoration: BoxDecoration(
            color: Color(0xFFF5C0C0),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'Meninggal',
                style: TextStyle(
                  color: Color(0xFF484848),
                ),
              ),
              Text(
                '895',
                style:
                TextStyle(color: Color(0xFFF82B2B), fontSize: 16),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                '12.68% Kasus',
                style: TextStyle(
                  color: Color(0xFF484848),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
