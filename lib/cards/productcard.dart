import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:s.bshop/checkuser/check.dart';
import 'package:s.bshop/checkuser/checkCart.dart';
import 'package:s.bshop/model/article_model.dart';
import 'package:s.bshop/article/detail.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget productcard(Article article, BuildContext context) {
  Future addTofav() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection("favorites");
    return _collectionRef.doc(currentUser.email).collection("items").doc().set({
      "title": article.title,
      "images": article.urlToImage,
      "author": article.author,
    }).then(
        (value) => Fluttertoast.showToast(msg: "Product Added In favorite"));
  }

    Future addTocart() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection("cart");
    return _collectionRef.doc(currentUser.email).collection("items").doc().set({
      "title": article.title,
      "images": article.urlToImage,
      "author": article.author,
    }).then(
        (value) => Fluttertoast.showToast(msg: "Product Added In cart"));
  }

  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ArticlePage(
                    article: article,
                  )));
    },
    child: Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: (article.urlToImage == null)
                      ? AssetImage('images/back1.jpg')
                      : AssetImage('images/back1.jpg'),
                  fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Mercedes Benz",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
           SizedBox(
            height: 5,
          ),
          // Align(
          //   alignment: Alignment.topLeft,
          //   child: Container(
          //       decoration: new BoxDecoration(
          //           // color: Colors.black,
          //           borderRadius: new BorderRadius.circular(60)),
          //       child: Text(
          //         article.source.name,
          //         style: TextStyle(
          //           color: Color(0xff3edeb6),
          //           fontWeight: FontWeight.bold,
          //           fontSize: 20,
          //         ),
          //       )),
          // ),
          Row(children: [
            // check(article, context)
            Container(child: check(article, context)),
            SizedBox(
              width: 120,
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: Row(children: [
                              Container(child: checkCart(article, context)),

                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Price:- 10000 PKR',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: Colors.black),
                  ),
                ])),
          ]),
          Divider(
            thickness: 3,
          )
        ],
      ),
    ),
  );
}
