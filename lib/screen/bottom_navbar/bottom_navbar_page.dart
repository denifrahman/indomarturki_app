import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:indomarturki_app/screen/auth/auth_page.dart';
import 'package:indomarturki_app/screen/category/category_page.dart';
import 'package:indomarturki_app/screen/home/home_page.dart';
import 'package:indomarturki_app/screen/transaction/my_transaction_page.dart';

class BottomNavbar extends StatefulWidget {
  BottomNavbar({Key? key, required this.currentTab}) : super(key: key);
   int currentTab = 0;
  @override
  _BottomNavbarState createState() {
    return _BottomNavbarState();
  }
}

class _BottomNavbarState extends State<BottomNavbar> {
  Widget currentScreen = Home(); // Our first view in viewport
  List<Widget> _screen= [
    Home(),
    CategoryPage(),
    MyTransaction(),
    Auth()
  ];
  int currentTab = 0; // to keep track of active tab index
  @override
  void initState() {
    currentScreen = _screen[widget.currentTab];
    currentTab = widget.currentTab;
    super.initState();
  }
  final PageStorageBucket bucket = PageStorageBucket();
  @override
  void dispose() {
    super.dispose();
  }

  Future<bool> _onWillPop() async {
    if (currentTab == 0) {
      return (await showDialog(
        context: context,
        builder: (context) =>
        new AlertDialog(
          title: Text('Anda yakin!'),
          content: Text('Ingin keluar dari aplikasi?'),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('No'),
            ),
            FlatButton(
              onPressed: () => Navigator.of(context).pop(true),
              /*Navigator.of(context).pop(true)*/
              child: Text('Yes'),
            ),
          ],
        ),
      )) ?? false;
    } else {
      setState(() {
        currentScreen = Home();
        currentTab = 0;
      });
      return false;
    }
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: PageStorage(
          child: currentScreen,
          bucket: bucket,
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Container(
            color: Colors.white,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        setState(() {
                          currentScreen = Home(); // if user taps on this dashboard tab will be active
                          currentTab = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(CupertinoIcons.house_alt_fill,size: 20, color: currentTab == 0 ? Colors.yellow.shade800 : Colors.grey,),
                          Text(
                            'Beranda',
                            style: TextStyle(
                              fontSize: 12,
                              color: currentTab == 0 ? Colors.yellow.shade800 : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        setState(() {
                          currentScreen = CategoryPage(); // if user taps on this dashboard tab will be active
                          currentTab = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(CupertinoIcons.rectangle_grid_2x2_fill,size: 20,color: currentTab == 1 ? Colors.yellow.shade800 : Colors.grey,),
                          Text(
                            'Kategory',
                            style: TextStyle(
                              fontSize: 12,
                              color: currentTab == 1 ? Colors.yellow.shade800 : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        setState(() {
                          currentScreen = MyTransaction(); // if user taps on this dashboard tab will be active
                          currentTab = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(CupertinoIcons.square_list_fill,size: 20,color: currentTab == 2 ? Colors.yellow.shade800 : Colors.grey,),
                          Text(
                            'Pesanan',
                            style: TextStyle(
                              fontSize: 12,
                              color: currentTab == 2 ? Colors.yellow.shade800 : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        setState(() {
                          currentScreen = Auth(); // if user taps on this dashboard tab will be active
                          currentTab = 3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.account_circle,size: 20,color: currentTab == 3 ? Colors.yellow.shade800 : Colors.grey,),
                          Text(
                            'Akun',
                            style: TextStyle(
                              fontSize: 12,
                              color: currentTab == 3 ? Colors.yellow.shade800 : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}