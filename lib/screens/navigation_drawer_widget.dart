import 'package:flutter/material.dart';
import 'package:s.bshop/checkuser/userfavorite.dart';
import 'favourite.dart';
import 'login.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    final urlImage =
        'https://scontent.fkhi22-1.fna.fbcdn.net/v/t39.30808-6/247846825_609966876789479_2139499537730667437_n.jpg?_nc_cat=103&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=YIBE3HIQYbUAX_9DAww&_nc_ht=scontent.fkhi22-1.fna&oh=8c39c76b1f057c7c88e59fe0a31066bd&oe=61840220';
    return Drawer(
      child: Material(
        color: Color.fromRGBO(50, 75, 205, 1),
        child: ListView(
          children: <Widget>[
            buildHeader(
              urlImage: urlImage,
            ),
            buildMenuItem(
                text: 'Home',
                icon: Icons.people,
                onClicked: () => selectedItem(context, 0)),
            buildMenuItem(
                text: 'Favourite',
                icon: Icons.favorite_border,
                onClicked: () => selectedItem(context, 1)),
            buildMenuItem(
                text: 'Profile',
                icon: Icons.workspaces_outline,
                onClicked: () => selectedItem(context, 2)),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    String urlImage,
  }) =>
      InkWell(
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(
                radius: 120,
                backgroundImage: NetworkImage(urlImage),
              ),
            ],
          ),
        ),
      );

  Widget buildMenuItem({
    String text,
    IconData icon,
    VoidCallback onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      // leading: Icon(icon, color: color,size: 40,),
      title: Center(
          child: Text(text,
              style: TextStyle(
                  color: color, fontSize: 20, fontWeight: FontWeight.bold))),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => userfavorite()));
        break;
      case 1:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Favorites()));
        break;
      case 2:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Favorites()));
        break;
      case 3:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Favorites()));
        break;
      case 4:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Favorites()));
        break;
      case 5:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Favorites()));
        break;
    }
  }
}
