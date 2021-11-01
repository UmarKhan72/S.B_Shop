import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:s.bshop/screens/navigation_drawer_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  String collectionName = "cart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          title: Center(child: Text("Your Cart")),
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xff3edeb6),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection(collectionName)
            .doc(FirebaseAuth.instance.currentUser.email)
            .collection("items")
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Something is wrong"),
            );
          }

          return ListView.builder(
              itemCount: snapshot.data == null ? 0 : snapshot.data.docs.length,
              itemBuilder: (_, index) {
                DocumentSnapshot _documentSnapshot = snapshot.data.docs[index];
                void deleteitem() {
                  FirebaseFirestore.instance
                      .collection(collectionName)
                      .doc(FirebaseAuth.instance.currentUser.email)
                      .collection("items")
                      .doc(_documentSnapshot.id)
                      .delete();
                }

                return InkWell(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.all(12.0),
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Color(0xff3edeb6),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 200.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            //let's add the height

                            image: DecorationImage(
                                image: (_documentSnapshot['images'] == null)
                                    ? AssetImage('images/back1.jpg')
                                    : AssetImage('images/back1.jpg'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          _documentSnapshot['title'] != null
                              ? "Mercedes Benz"
                              : "Mercedes Benz",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(height: 10),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: " ", style: TextStyle(color: Colors.white)),
                          TextSpan(
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                              text: " ",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  var url = _documentSnapshot['url'] != null
                                      ? _documentSnapshot['url']
                                      : 'Top Product';
                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                }),
                        ])),
                        SizedBox(
                          height: 5,
                        ),
                        Row(children: [
                          Align(
                              alignment: Alignment.bottomLeft,
                              child: IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    deleteitem();
                                    Fluttertoast.showToast(
                                        msg: "Product Removed In cart");
                                  })),
                        ])
                      ],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
