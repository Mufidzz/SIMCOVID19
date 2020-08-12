

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simcovid19id/components/bgAtas/bgatas.dart';
import 'package:simcovid19id/model/Education.dart';

class EducationItemView extends StatefulWidget {
  Datum educationItem;

  EducationItemView({this.educationItem});
  @override
  _EducationItemViewState createState() => _EducationItemViewState(educationItem: this.educationItem );
}

class _EducationItemViewState extends State<EducationItemView> {
  Datum educationItem;

  _EducationItemViewState({this.educationItem});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color(0xFF34324B),
      ),
    );

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFFF5F5F5),
        body: SingleChildScrollView(
          child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              BgAtas(title: 'Edukasi COVID-19'),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(bottom: 16, left: 12, right: 12),
                child: Column(
                  children: <Widget>[
                    Text(
                      educationItem.title,
                      style: TextStyle(
                        fontSize: 20,
                        height: 1.5,
                        color: Color(0xFF484848),
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 8,
                    ),

                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: double.infinity,
                      height: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://simcovid.faftech.my.id/img/news/'+ educationItem.image),
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      educationItem.description,
                      style: TextStyle(
                          color: Color(0xFF484848),
                          fontSize: 17, height: 1.5
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
