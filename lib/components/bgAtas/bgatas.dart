import 'package:flutter/material.dart';
import 'package:simcovid19id/views/dashboard/dashboard.dart';
import 'package:simcovid19id/views/dashboard/user_account/useraccount.dart';

class BgAtas extends StatelessWidget {
  String title;

  BgAtas({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: MyClipperBG(),
          child: Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/coronaVirus4.png'),
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.bottomRight,
                ),
                color: Color(0xFF34324B)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => Dashboard(),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 6,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class MyClipperBG extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = Path();

    path.lineTo(0, size.height - 10);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 10);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
