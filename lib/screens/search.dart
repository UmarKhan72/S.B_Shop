import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:s.bshop/categories/topstories.dart';

import 'navigation_drawer_widget.dart';

class Search extends StatefulWidget {
  const Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: NavigationDrawerWidget(),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: AppBar(
            backgroundColor: Color(0xff3edeb6),
            title: Center(
                child: Text(
              "Search",
              style: TextStyle(color: Color(0xfffffffff)),
            )),
          )),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 90,
            ),
            Image.asset('./images/playstore.png'),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        primary: Color(0xff3edeb6),
                        padding: EdgeInsets.fromLTRB(100, 20, 100, 20)),
                    onPressed: () {
                      showSearch(context: context, delegate: DataSearch());
                    },
                    child: Text("Search")),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final news = [
    "Mercedes Benz",
  ];

  final recent = [
   "Mercedes Benz",
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Column(
        children: [],
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggest = query.isEmpty
        ? recent
        : news.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (contex, index) => ListTile(
        onTap: () {
          showResults(context);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Topstories()));
        },
        leading: Icon(Icons.search),
        title: RichText(
          text: TextSpan(
              text: suggest[index].substring(0, query.length),
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: suggest[index].substring(query.length),
                    style: TextStyle(color: Colors.grey))
              ]),
        ),
      ),
      itemCount: suggest.length,
    );
  }
}
