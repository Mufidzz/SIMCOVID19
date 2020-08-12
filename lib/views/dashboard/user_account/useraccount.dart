import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simcovid19id/model/User.dart';
import 'package:simcovid19id/providers/userProvider.dart';
import 'package:simcovid19id/views/auth/login/login.dart';

class UserAccount extends StatefulWidget {
  @override
  _UserAccountState createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  String id;
  Future<User> futureUser;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      id = preferences.getString("IDUser");
      futureUser = Provider.of<UserProvider>(context, listen: false).fetchUser(id);
    });
  }

  @override
  void initState() {
    getPref();

  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
      future: futureUser,
      builder: (context, snapshot){
        if(snapshot.hasData){
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
                          width: MediaQuery.of(context).size.height / 2.5,
                          height: MediaQuery.of(context).size.height / 2.5,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/coronaVirus3.png'),
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
                        ClipRRect(
                          child: Container(
                            width: 105,
                            height: 105,
                            color: Colors.teal,
                          ),
                          borderRadius: BorderRadius.circular(55),
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
                                top: 16, bottom: 16, left: 32, right: 32),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  snapshot.data.data.username,
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Color(0xFF484848),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.red,
                                    ),
                                    Text(
                                      snapshot.data.data.alamat,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF484848),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  snapshot.data.data.umur.toString(),
                                  style: TextStyle(
                                      color: Color(0xFF484848), fontSize: 16),
                                ),
                                Text(
                                  snapshot.data.data.jenisKelamin == 'L' ? 'laki-laki' : 'perempuan',
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
                                        'Persebaran '+snapshot.data.data.alamat,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
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
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
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
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              RaisedButton(
                                onPressed: () {
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
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
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
        } else if(snapshot.hasError){
          return Center(child: Text("${snapshot.error}"));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
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
