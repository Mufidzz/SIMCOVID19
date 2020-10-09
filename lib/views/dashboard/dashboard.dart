import 'package:flutter/material.dart';
import 'package:simcovid19id/views/dashboard/home/home.dart';
import 'package:simcovid19id/views/dashboard/user_account/useraccount.dart';
import 'package:simcovid19id/views/soon/soon.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _bottomNavIndex = 1;

  final List<Widget> _children = [UserAccount(), Home(), Soon()];

  void onTappedBar(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _children[_bottomNavIndex],
        bottomNavigationBar: new BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _bottomNavIndex,
          onTap: onTappedBar,
          items: [
            BottomNavigationBarItem(
              title: Text("Publish"),
              icon: Icon(const IconData(0xe900, fontFamily: 'person'),
                  color: _bottomNavIndex == 0 ? Colors.black : Colors.black45),
            ),
            BottomNavigationBarItem(
              title: Text("Dashboard"),
              icon: Icon(const IconData(0xe800, fontFamily: 'home'),
                  color: _bottomNavIndex == 1 ? Colors.black : Colors.black45),
            ),
            BottomNavigationBarItem(
              title: Text("Notifications"),
              icon: Icon(const IconData(0xe800, fontFamily: 'help'),
                  color: _bottomNavIndex == 2 ? Colors.black : Colors.black45),
            ),
          ],
        ),
      ),
    );
  }
}
