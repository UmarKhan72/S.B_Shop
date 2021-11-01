import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:s.bshop/model/article_model.dart';
import 'package:flutter/cupertino.dart';

Widget check(Article article, BuildContext context) {
  Future addTofav() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection("favorites");
    return _collectionRef.doc(currentUser.email).collection("items").doc().set({
      "title": article.title,
      "images": article.urlToImage,
      "author": article.author,
      "url": article.url,
    }).then((value) =>
        Fluttertoast.showToast(msg: "Product Is Added In Your Cart"));
  }

  User user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("favorites")
          .doc(FirebaseAuth.instance.currentUser.email)
          .collection("items")
          .where("title", isEqualTo: article.title)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              iconSize: 30,
              onPressed: () => snapshot.data.docs.length == 0
                  ? addTofav()
                  : Fluttertoast.showToast(msg: "Already Done"),
              icon: snapshot.data.docs.length == 0
                  ? Icon(
                      Icons.favorite_outline,
                      color: Colors.black,
                    )
                  : Icon(
                      Icons.favorite,
                      color: Color(0xff3edeb6),
                    ),
            ),
          );
        }
        return IconButton(
            icon: Icon(Icons.favorite_border_outlined),
            onPressed: () {
              var snackBar = SnackBar(content: Text('Please Login first'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            });
      },
    );
  } else {
    return IconButton(
        icon: Icon(Icons.favorite_border_outlined),
        onPressed: () {
          var snackBar = SnackBar(content: Text('Please Login first'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
  }
}
