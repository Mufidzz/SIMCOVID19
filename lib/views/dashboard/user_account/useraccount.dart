import 'dart:io';
import 'dart:async';
import 'package:toast/toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simcovid19id/config/globalConfig.dart';
import 'package:simcovid19id/providers/userProvider.dart';
import 'package:simcovid19id/views/auth/login/login.dart';
import 'package:image_picker/image_picker.dart';
import '../../../providers/userProvider.dart';

class UserAccount extends StatefulWidget {
  @override
  _UserAccountState createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  String id, username;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      id = preferences.getString("IDUser");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: RefreshIndicator(
        onRefresh: () =>
            Provider.of<UserProvider>(context, listen: false).fetchUser(id),
        color: Colors.red,
        child: FutureBuilder(
            future: Future.wait([
              Provider.of<UserProvider>(context, listen: false).fetchUser(id)
            ]),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Consumer<UserProvider>(
                builder: (context, dataUser, _) {
                  return SafeArea(
                    child: SingleChildScrollView(
                      child: Stack(
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              ClipPath(
                                clipper: MyClipper(),
                                child: Container(
                                  width: double.infinity,
                                  height: 530,
                                  color: Color(0xFF34324B),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.height / 2.5,
                                  height:
                                      MediaQuery.of(context).size.height / 2.5,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/coronaVirus3.png'),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 32, bottom: 32),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Stack(
                                  children: <Widget>[
                                    CircleAvatar(
                                      radius: 50,
                                      backgroundColor: Colors.blueAccent,
                                      child: CircleAvatar(
                                          radius: 45,
                                          backgroundImage: dataUser
                                                      .userModel.data.photo ==
                                                  null
                                              ? AssetImage(
                                                  'assets/images/logo.png')
                                              : (imageFile == null
                                                  ? NetworkImage(
                                                      CONFIG.IMG_URL +
                                                          '/users/' +
                                                          dataUser.userModel
                                                              .data.photo)
                                                  : AssetImage(
                                                      imageFile.path))),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: GestureDetector(
                                        onTap: () {
                                          _showChoiceDialog(context);
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(55),
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            color: Colors.blueAccent,
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 22,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width - 50,
                                  height: 230,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 16,
                                        bottom: 16,
                                        left: 32,
                                        right: 32),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text(
                                          dataUser.userModel.data.username
                                              .toUpperCase(),
                                          style: TextStyle(
                                            fontSize: 22,
                                            color: Color(0xFF484848),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(
                                              Icons.location_on,
                                              color: Colors.red,
                                            ),
                                            Text(
                                              dataUser.userModel.data.alamat,
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF484848),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          dataUser.userModel.data.umur
                                                  .toString() +
                                              " Tahun",
                                          style: TextStyle(
                                              color: Color(0xFF484848),
                                              fontSize: 16),
                                        ),
                                        Text(
                                          dataUser.userModel.data
                                                      .jenisKelamin ==
                                                  'L'
                                              ? 'Laki-laki'
                                              : 'Perempuan',
                                          style: TextStyle(
                                            color: Color(0xFF484848),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 16,
                                        ),
                                        RaisedButton(
                                          onPressed: () {},
                                          color: Color(0xFFBFE9C6),
                                          child: Container(
                                            width: double.infinity,
                                            height: 50,
                                            child: Center(
                                              child: Text(
                                                'Persebaran ' +
                                                    dataUser
                                                        .userModel.data.alamat,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ),
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 32,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 55, right: 55),
                                  child: Column(
                                    children: <Widget>[
                                      RaisedButton(
                                        onPressed: () {},
                                        color: Color(0xFFF7D5AD),
                                        child: Container(
                                          width: double.infinity,
                                          height: 50,
                                          child: Center(
                                            child: Text(
                                              'Mendaftar Sebagai Relawan',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                          ),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      RaisedButton(
                                        onPressed: () {},
                                        color: Color(0xFFAED9F8),
                                        child: Container(
                                          width: double.infinity,
                                          height: 50,
                                          child: Center(
                                            child: Text(
                                              'Donasi',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                          ),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      RaisedButton(
                                        onPressed: () {
                                          savePrefBoolean('logged', false);
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              builder: (context) => Login(),
                                            ),
                                          );
                                        },
                                        color: Color(0xFFF5C0C0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 50,
                                          child: Center(
                                            child: Text(
                                              'Keluar',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                          ),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
      ),
    );
  }

  savePrefBoolean(String key, bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setBool(key, value);
    });
  }

  savePrefString(String key, String value) async {
    print('saveprefstring');
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setString(key, value);
    });
  }

  File imageFile;
  static var selectImage = "Pilih Gambar";

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Pilih metode upload"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      _openGallery(context);
                    },
                    child: Text("Gallery"),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    onTap: () {
                      _openCamera(context);
                    },
                    child: Text("Camera"),
                  )
                ],
              ),
            ),
          );
        });
  }

  _openCamera(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      imageFile = File(pickedFile.path);
    });
    Upload(imageFile);
    Navigator.of(context).pop();
  }

  _openGallery(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      imageFile = File(pickedFile.path);
    });
    Upload(imageFile);
    Navigator.of(context).pop();
  }

  Upload(File imageFile) async {
    String fileName = imageFile.path.split('/').last;
    String url = CONFIG.POST_IMAGE + id;
    print(url);
    FormData data = FormData.fromMap({
      "file": await MultipartFile.fromFile(
        imageFile.path,
        filename: fileName,
      ),
    });

    Dio dio = new Dio();

    dio.post(url, data: data).then((response) => print(response)).catchError(
        (error) =>
            showToast("Gambar tidak dapat di muat", gravity: Toast.CENTER));
  }

  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = Path();

    path.lineTo(0, size.height - 30);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 30);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
