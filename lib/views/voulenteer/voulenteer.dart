import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:simcovid19id/components/bgAtas/bgatas.dart';
import 'package:simcovid19id/components/bgAtas/special.dart';
import 'package:simcovid19id/providers/volunteerProvider.dart';
import 'package:toast/toast.dart';

import '../dashboard/dashboard.dart';

class VolunteerRegistration extends StatefulWidget {
  @override
  _VolunteerRegistrationState createState() => _VolunteerRegistrationState();
}

enum SingingCharacter { self, other }

class _VolunteerRegistrationState extends State<VolunteerRegistration> {
  SingingCharacter _character = SingingCharacter.self;
  TextEditingController fullNameController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  TextEditingController nikController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController professionController = new TextEditingController();
  TextEditingController motivationController = new TextEditingController();
  TextEditingController skillDescriptionController =
      new TextEditingController();
  TextEditingController instagramController = new TextEditingController();
  TextEditingController facebookController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color(0xFF34324B),
      ),
    );
    var _enabled;
    return MaterialApp(
      color: Color(0xFFE9EAE9),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Material(
                child: Column(
              children: <Widget>[
                BgAtas(
                  title: "Pendaftaran Relawan",
                ),
                Report(context),
              ],
            )),
          ),
        ),
      ),
    );
  }

  void sendVolunteer(BuildContext context) {
    final volunteer = Provider.of<VolunteerProvider>(context, listen: false);
    print('button ditekan');
    if (fullNameController.text.isEmpty ||
        addressController.text.isEmpty ||
        nikController.text.isEmpty ||
        phoneController.text.isEmpty ||
        emailController.text.isEmpty ||
        motivationController.text.isEmpty ||
        skillDescriptionController.text.isEmpty) {
      Toast.show("Wajib mengisi field yang memiliki *", context,
          duration: Toast.LENGTH_SHORT);
    } else {
      volunteer
          .sendVolunteer(
        fullNameController.text,
        addressController.text,
        nikController.text,
        phoneController.text,
        emailController.text,
        professionController.text,
        motivationController.text,
        skillDescriptionController.text,
        instagramController.text,
        facebookController.text,
      )
          .then((value) {
        if (value == 200) {
          Toast.show("berhasil mengirimkan data", context,
              duration: Toast.LENGTH_SHORT);
          Navigator.of(context).pop();
        }
      });
    }
  }

  Widget Report(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 12,
              ),
              Container(
                width: 300,
                height: 750,
                decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 5, top: 5),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Silahkan Isi Data",
                          style: TextStyle(
                              color: Color(0xFF717082),
                              fontSize: 12,
                              fontFamily: 'Avenir'),
                        ),
                      ),
                    ),
                    Container(
                      width: 300,
                      height: 1,
                      color: Color(0xFF717082),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 5),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Nama Lengkap*",
                          style: TextStyle(
                              color: Color(0xFF717082),
                              fontSize: 12,
                              fontFamily: 'Avenir'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                      child: Container(
                        width: 285,
                        height: 25,
                        child: TextField(
                          controller: fullNameController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              fillColor: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 5),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Alamat Lengkap*",
                          style: TextStyle(
                              color: Color(0xFF717082),
                              fontSize: 12,
                              fontFamily: 'Avenir'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                      child: Container(
                        width: 285,
                        height: 50,
                        child: TextField(
                          controller: addressController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              fillColor: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 5),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "NIK*",
                          style: TextStyle(
                              color: Color(0xFF717082),
                              fontSize: 12,
                              fontFamily: 'Avenir'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                      child: Container(
                        width: 285,
                        height: 25,
                        child: TextField(
                          controller: nikController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              fillColor: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 5),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Nomor Telepon*",
                          style: TextStyle(
                              color: Color(0xFF717082),
                              fontSize: 12,
                              fontFamily: 'Avenir'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                      child: Container(
                        width: 285,
                        height: 25,
                        child: TextField(
                          controller: phoneController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              fillColor: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 5),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Email*",
                          style: TextStyle(
                              color: Color(0xFF717082),
                              fontSize: 12,
                              fontFamily: 'Avenir'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                      child: Container(
                        width: 285,
                        height: 25,
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              fillColor: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 5),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Pekerjaan",
                          style: TextStyle(
                              color: Color(0xFF717082),
                              fontSize: 12,
                              fontFamily: 'Avenir'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                      child: Container(
                        width: 285,
                        height: 25,
                        child: TextField(
                          controller: professionController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              fillColor: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 5),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Motivasi Mendaftar Sebagai Relawan*",
                          style: TextStyle(
                              color: Color(0xFF717082),
                              fontSize: 12,
                              fontFamily: 'Avenir'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                      child: Container(
                        width: 285,
                        height: 50,
                        child: TextField(
                          controller: motivationController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              fillColor: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 5),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Deskripsikan Keahlian Anda yang Dapat Berguna Ketika Menjadi Relawan Nantinya*",
                          style: TextStyle(
                              color: Color(0xFF717082),
                              fontSize: 12,
                              fontFamily: 'Avenir'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                      child: Container(
                        width: 285,
                        height: 50,
                        child: TextField(
                          controller: skillDescriptionController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              fillColor: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 5),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Media Sosial",
                          style: TextStyle(
                              color: Color(0xFF717082),
                              fontSize: 12,
                              fontFamily: 'Avenir'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Instagram",
                            style: TextStyle(
                                color: Color(0xFF717082),
                                fontSize: 12,
                                fontFamily: 'Avenir'),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                            child: Container(
                              width: 145,
                              height: 50,
                              child: TextField(
                                controller: instagramController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    fillColor: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Facebook",
                            style: TextStyle(
                                color: Color(0xFF717082),
                                fontSize: 12,
                                fontFamily: 'Avenir'),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                            child: Container(
                              width: 145,
                              height: 50,
                              child: TextField(
                                controller: facebookController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    fillColor: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          width: 285,
                          child: FlatButton(
                            color: Colors.blue,
                            textColor: Colors.white,
                            disabledColor: Colors.grey,
                            disabledTextColor: Colors.black,
                            padding: EdgeInsets.only(left: 5, right: 5),
                            splashColor: Colors.blueAccent,
                            onPressed: () => sendVolunteer(context),
                            child: Text("Kirim",
                                style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontSize: 12,
                                    fontFamily: 'Avenir')),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
