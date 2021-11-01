import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:s.bshop/bottombar.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:s.bshop/screens/signup.dart';

import 'navigation_drawer_widget.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final storage = new FlutterSecureStorage();

  bool _isHidden = true;
  bool loggedIn = false;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void login() async {
      FirebaseAuth auth = FirebaseAuth.instance;
      FirebaseFirestore db = FirebaseFirestore.instance;
      final String email = emailController.text;
      final String password = passwordController.text;
      try {
        final UserCredential user = await auth.signInWithEmailAndPassword(
            email: email, password: password);
        await storage.write(key: "uid", value: user.user.uid);
        final DocumentSnapshot snapshot =
            await db.collection("user").doc(user.user.uid).get();
        snapshot.data();
        this.setState(() {
          loggedIn = true;
        });
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => Bottombar()));
        print("user is logged in");
      } catch (e) {
        print("error");
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Text(e.toString()),
              );
            });
      }
    }

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: AppBar(
            title: Center(child: Text("Your Favorites")),
            automaticallyImplyLeading: false,
            backgroundColor: Color(0xff3edeb6),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: [
                Container(),
                SizedBox(
                  height: 90,
                ),
                Container(
                    alignment: Alignment.center,
                    child: Text(
                      'S.B Shop',
                      style: TextStyle(
                          fontSize: 40,
                          color: Color(0xff3edeb6),
                          fontWeight: FontWeight.bold),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    cursorColor: Colors.black,
                    controller: emailController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color(0xff3edeb6),
                      ),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff3edeb6)),
                          borderRadius: BorderRadius.circular(25)),
                      fillColor: Color.fromRGBO(255, 255, 255, 0.6),
                      filled: true,
                      hoverColor: Colors.amber[800],
                      labelStyle: TextStyle(color: Color(0xff3edeb6)),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    textInputAction: TextInputAction.go,
                    style: TextStyle(color: Colors.black),
                    cursorColor: Colors.black,
                    controller: passwordController,
                    obscureText: _isHidden,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.vpn_key,
                        color: Color(0xff3edeb6),
                      ),
                      suffix: InkWell(
                        onTap: _togglePasswordView,
                        child: Icon(
                          _isHidden ? Icons.visibility : Icons.visibility_off,
                          color: Color(0xff3edeb6),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: (Color(0xff3edeb6)))),
                      hoverColor: Colors.amber[800],
                      fillColor: Color.fromRGBO(255, 255, 255, 0.6),
                      filled: true,
                      labelStyle: TextStyle(color: Color(0xff3edeb6)),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Container(
                  height: 70,
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        primary: Color(0xff3edeb6),
                      ),
                      onPressed: login,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Text("Login"),
                      )),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Column(
                      children: [
                        Text(
                          "Want to create any account ?",
                          style: TextStyle(color: Color(0xff3edeb6)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0),
                                  ),
                                  primary: Color(0xff3edeb6),
                                  padding: EdgeInsets.fromLTRB(100, 0, 100, 0)),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => (Signup())));
                              },
                              child: Text("Sign up")),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ));
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
