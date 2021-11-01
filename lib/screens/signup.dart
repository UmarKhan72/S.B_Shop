import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:s.bshop/bottombar.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {
    final TextEditingController fnameController = TextEditingController();
    final TextEditingController lnameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController urlcontroller = TextEditingController();

    void register() async {
      FirebaseAuth auth = FirebaseAuth.instance;
      FirebaseFirestore db = FirebaseFirestore.instance;
      final String fname = fnameController.text;
      final String lname = lnameController.text;
      final String email = emailController.text;
      final String password = passwordController.text;
      final String phone = phoneController.text;
      final String url = urlcontroller.text;
      try {
        final UserCredential user = await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        await db.collection("users").doc(user.user.uid).set({
          "email": email,
          "first_name": fname,
          "last_name": lname,
          "password": password,
          "phone_number": phone,
          "url": url,
        });
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Bottombar()));
        print("user is registerd");
      } catch (e) {
        print(e);
      }
    }

    return Scaffold(
        body: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
                padding: EdgeInsets.all(3),
                child: ListView(
                  children: <Widget>[
                    Container(),
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(3),
                        child: Text(
                          'Sign Up',
                          style:
                              TextStyle(fontSize: 20, color: Color(0xff3edeb6)),
                        )),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        style: TextStyle(color: Color(0xff3edeb6)),
                        cursorColor: Color(0xff3edeb6),
                        controller: fnameController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Color(0xff3edeb6),
                          ),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff3edeb6))),
                          hoverColor: Colors.amber[800],
                          labelStyle: TextStyle(color: Color(0xff3edeb6)),
                          fillColor: Color.fromRGBO(255, 255, 255, 0.6),
                          filled: true,
                          labelText: 'First Name',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        style: TextStyle(color: Color(0xff3edeb6)),
                        cursorColor: Color(0xff3edeb6),
                        controller: lnameController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Color(0xff3edeb6),
                          ),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff3edeb6))),
                          hoverColor: Colors.amber[800],
                          labelStyle: TextStyle(color: Color(0xff3edeb6)),
                          labelText: 'Last Name',
                          fillColor: Color.fromRGBO(255, 255, 255, 0.6),
                          filled: true,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        style: TextStyle(color: Color(0xff3edeb6)),
                        cursorColor: Color(0xff3edeb6),
                        controller: emailController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Color(0xff3edeb6),
                          ),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff3edeb6))),
                          hoverColor: Colors.amber[800],
                          labelStyle: TextStyle(color: Color(0xff3edeb6)),
                          fillColor: Color.fromRGBO(255, 255, 255, 0.6),
                          filled: true,
                          labelText: 'Email',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        style: TextStyle(color: Color(0xff3edeb6)),
                        cursorColor: Color(0xff3edeb6),
                        controller: phoneController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Color(0xff3edeb6),
                          ),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff3edeb6))),
                          hoverColor: Colors.amber[800],
                          labelStyle: TextStyle(color: Color(0xff3edeb6)),
                          fillColor: Color.fromRGBO(255, 255, 255, 0.6),
                          filled: true,
                          labelText: 'Mobile Number',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        textInputAction: TextInputAction.go,
                        style: TextStyle(color: Color(0xff3edeb6)),
                        cursorColor: Color(0xff3edeb6),
                        controller: passwordController,
                        obscureText: _isHidden,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.vpn_key,
                            color: Color(0xff3edeb6),
                          ),
                          border: OutlineInputBorder(),
                          suffix: InkWell(
                            onTap: _togglePasswordView,
                            child: Icon(
                              _isHidden
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Color(0xff3edeb6),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff3edeb6))),
                          hoverColor: Colors.amber[800],
                          labelStyle: TextStyle(color: Color(0xff3edeb6)),
                          labelText: 'Password (at least 6 char)',
                          fillColor: Color.fromRGBO(255, 255, 255, 0.6),
                          filled: true,
                        ),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xff3edeb6),
                            ),
                            child: Text('Sign up'),
                            onPressed: register)),
                  ],
                ))));
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
