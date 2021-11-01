import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:s.bshop/screens/home.dart';
import 'package:s.bshop/screens/search.dart';
import 'package:s.bshop/checkuser/userprofile.dart';
import 'package:s.bshop/checkuser/userfavorite.dart';
import 'package:bottom_bars/bottom_bars.dart';

import 'checkuser/userCart.dart';

class Bottombar extends StatefulWidget {
  @override
  _BottombarState createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  @override
  Widget build(BuildContext context) {
// SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: BottomBars(
        backgroundBarColor: Color(0xff3edeb6),
        items: [
          BottomBarsItem(
            page: Scaffold(
              body: Home(),
            ),
            item: Item(
              // activeColor: Color(0xff000000),
              color: Colors.white,
              icon: Icons.home,
              iconSize: 33,
              title: Text("Home"),
            ),
          ),
          BottomBarsItem(
            page: Scaffold(
              body: Search(),
            ),
            item: Item(
              // activeColor: Color(0xff000000),
              color: Colors.white,
              icon: Icons.search_sharp,
              iconSize: 33,
              title: Text(
                "Search",
              ),
            ),
          ),
          BottomBarsItem(
            page: Scaffold(
              body: userfavorite(),
            ),
            item: Item(
              // activeColor: Color(0xff000000),
              icon: Icons.favorite_outline,
              iconSize: 33,
              title: Text("Favorite"),
              color: Colors.white,
            ),
          ),
          BottomBarsItem(
            page: Scaffold(
              body: userCart(),
            ),
            item: Item(
              // activeColor: Color(0xff000000),
              icon: Icons.shopping_cart,
              iconSize: 33,
              title: Text("Cart"),
              color: Colors.white,
            ),
          ),
           BottomBarsItem(
            page: Scaffold(
              body: userprofile(),
            ),
            item: Item(
              // activeColor: Color(0xff000000),
              icon: Icons.person_outline,
              iconSize: 33,
              title: Text("Profile"),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
