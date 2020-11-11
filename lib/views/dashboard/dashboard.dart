import 'package:flutter/material.dart';
import 'package:simcovid19id/views/dashboard/home/home.dart';
import 'package:simcovid19id/views/dashboard/user_account/useraccount.dart';
import 'package:simcovid19id/views/soon/soon.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _page = 1;
  PageController _c;

  // final List<Widget> _children = [UserAccount(), Home(), Soon()];

  @override
  void initState() {
    _c = new PageController(
      initialPage: _page,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: new BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _page,
        onTap: (index) {
          this._c.animateToPage(
                index,
                duration: const Duration(
                  milliseconds: 500,
                ),
                curve: Curves.easeInOut,
              );
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: "Person",
            icon: Icon(const IconData(0xe900, fontFamily: 'person'),
                color: _page == 0 ? Colors.black : Colors.black45),
          ),
          BottomNavigationBarItem(
            label: "Dashboard",
            icon: Icon(const IconData(0xe800, fontFamily: 'home'),
                color: _page == 1 ? Colors.black : Colors.black45),
          ),
          BottomNavigationBarItem(
            label: "Help",
            icon: Icon(const IconData(0xe800, fontFamily: 'help'),
                color: _page == 2 ? Colors.black : Colors.black45),
          ),
        ],
      ),
      body: new PageView(
        controller: _c,
        onPageChanged: (newPage) {
          setState(() {
            this._page = newPage;
          });
        },
        children: [
          UserAccount(),
          Home(),
          Soon(),
        ],
      ),
    );
  }
}
