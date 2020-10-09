import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simcovid19id/components/bgAtas/bgatas.dart';
import 'package:simcovid19id/config/globalConfig.dart';
import 'package:simcovid19id/model/EducationCategoryDetail.dart';

class EducationItemView extends StatefulWidget {
  Education education;

  EducationItemView({Key key, @required this.education}) : super(key: key);

  @override
  _EducationItemViewState createState() =>
      _EducationItemViewState(education: education);
}

class _EducationItemViewState extends State<EducationItemView> {
  Education education;

  _EducationItemViewState({@required this.education});

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
                      education.title,
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
                            image: NetworkImage(CONFIG.EDUCATION_IMG_URL +
                                "/" +
                                education.image),
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      education.description,
                      style: TextStyle(
                          color: Color(0xFF484848), fontSize: 17, height: 1.5),
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
