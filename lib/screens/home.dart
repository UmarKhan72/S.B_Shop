import 'package:flutter/material.dart';
import 'package:s.bshop/categories/topstories.dart';
import 'package:s.bshop/categories/technology.dart';
import 'package:s.bshop/categories/sport.dart';
import 'package:s.bshop/categories/headlines.dart';
import 'package:s.bshop/categories/business.dart';
import 'package:s.bshop/categories/travel.dart';
import 'package:s.bshop/categories/popular.dart';
import 'navigation_drawer_widget.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 7,
        child: Scaffold(
          // drawer: NavigationDrawerWidget(),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(75),
            child: AppBar(
              flexibleSpace: Center(
                child: Container(
                  height: 40,
                  child: Text(
                    "S.B Shop",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 27,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              backgroundColor: Color(0xff3edeb6),
              bottom: TabBar(
                isScrollable: true,
                labelColor: Color(0xffffffff),
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(text: "Cars"),
                  Tab(text: "Electroics"),
                  Tab(text: "Mobiles"),
                  Tab(text: "Bikes"),
                  Tab(text: "Computers"),
                  Tab(text: "Laptops"),
                  Tab(text: "Cloths"),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              Topstories(),
              Headlines(),
              Popular(),
              Business(),
              Travel(),
              Technology(),
              Sports(),
            ],
          ),
        ),
      ),
    );
  }
}
