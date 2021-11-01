import 'package:flutter/gestures.dart';
import 'package:s.bshop/model/article_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticlePage extends StatelessWidget {
  final Article article;

  ArticlePage({this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Mercedes Benz",
            style: TextStyle(color: Color(0xff3edeb6)),
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Color(0xff3edeb6),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: (article.urlToImage == null)
                            ? AssetImage('images/back1.jpg')
                            : AssetImage('images/back1.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // Container(
                //   padding: EdgeInsets.all(6.0),
                //   child: Text(
                //     article.source.name != null
                //         ? article.source.name
                //         : 'No source',
                //     style: TextStyle(
                //       color: Color(0xff3edeb6),
                //       fontWeight: FontWeight.bold,
                //       fontSize: 20,
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  "Mercedes Benz",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26.0,
                  ),
                ),
                Text(
                  article.description != null
                      ? "Mercedes-Benz traces its origins to Karl Benz's creation of the first internal combustion engine in a car, seen in the Benz Patent Motorwagen – financed by Bertha Benz's dowry[10] and patented in January 1886[11] – and Gottlieb Daimler and their engineer Wilhelm Maybach's conversion of a stagecoach, with the addition of a petrol engine, introduced later that year. The Mercedes automobile was first marketed in 1901 by Daimler-Motoren-Gesellschaft (DMG).Emil Jellinek, an European automobile entrepreneur who worked with Daimler Motoren Gesellschaft (DMG), registered the trademark in 1902, naming the 1901 Mercedes 35 hp after his daughter Mercedes Jellinek. Jellinek was a businessman and marketing strategist who promoted Daimler automobiles among the highest circles of society in his adopted home. At the time, it was a meeting place for the Haute Vole of France and Europe, especially in winter. His customers included the Rothschild family and other well-known personnelles. But Jellinek's plans went further, in as early as 1901, he was selling Mercedes cars in the as well, including United States billionaires Rockefeller, Astor, Morgan, and Taylor. At the Nice race he attended in 1899, Jellinek drove under the pseudonym as a way of concealing his less fancy real name. Many consider, that race the time of birth for Mercedes-Benz as a brand. Later, in 1901, the name Mercedes was re-registered by DMG worldwide as a protected trademark.[12] The first Mercedes-Benz branded vehicles were produced in 1926, following the merger of Karl Benz's and Gottlieb Daimler's companies into the Daimler-Benz company on 28 June of the same year.[11][13]"
                      : "Mercedes-Benz traces its origins to Karl Benz's creation of the first internal combustion engine in a car, seen in the Benz Patent Motorwagen – financed by Bertha Benz's dowry[10] and patented in January 1886[11] – and Gottlieb Daimler and their engineer Wilhelm Maybach's conversion of a stagecoach, with the addition of a petrol engine, introduced later that year. The Mercedes automobile was first marketed in 1901 by Daimler-Motoren-Gesellschaft (DMG).Emil Jellinek, an European automobile entrepreneur who worked with Daimler Motoren Gesellschaft (DMG), registered the trademark in 1902, naming the 1901 Mercedes 35 hp after his daughter Mercedes Jellinek. Jellinek was a businessman and marketing strategist who promoted Daimler automobiles among the highest circles of society in his adopted home. At the time, it was a meeting place for the Haute Vole of France and Europe, especially in winter. His customers included the Rothschild family and other well-known personnelles. But Jellinek's plans went further, in as early as 1901, he was selling Mercedes cars in the as well, including United States billionaires Rockefeller, Astor, Morgan, and Taylor. At the Nice race he attended in 1899, Jellinek drove under the pseudonym as a way of concealing his less fancy real name. Many consider, that race the time of birth for Mercedes-Benz as a brand. Later, in 1901, the name Mercedes was re-registered by DMG worldwide as a protected trademark.[12] The first Mercedes-Benz branded vehicles were produced in 1926, following the merger of Karl Benz's and Gottlieb Daimler's companies into the Daimler-Benz company on 28 June of the same year.[11][13]",
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                // SizedBox(
                //   height: 10,
                // ),
                // Text(
                //   article.content != null
                //       ? article.content
                //       : 'Content Not available',
                //   style: TextStyle(
                //     fontSize: 13,
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // RichText(
                //     text: TextSpan(children: [
                //   TextSpan(
                //       text: "To see more full article ",
                //       style: TextStyle(color: Colors.black)),
                //   TextSpan(
                //       style: TextStyle(
                //         color: Colors.red,
                //         fontWeight: FontWeight.bold,
                //       ),
                //       text: "Click here",
                //       recognizer: TapGestureRecognizer()
                //         ..onTap = () async {
                //           var url = article.url != null
                //               ? article.url
                //               : 'Breaking News';
                //           if (await canLaunch(url)) {
                //             await launch(url);
                //           } else {
                //             throw 'Could not launch $url';
                //           }
                //         }),
                // ])),
                // SizedBox(
                //   height: 10,
                // ),
                // Text("Author:"),
                // Text(
                //   article.author != null ? article.author : 'Unknown',
                //   style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       fontSize: 12,
                //       color: Colors.blue),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // Text("News pubshiled at:"),
                // Text(
                //   "News pubshiled at: " + article.publishedAt != null
                //       ? article.publishedAt
                //       : '! hour ago',
                //   style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       fontSize: 12,
                //       color: Colors.blue),
                // ),
              ],
            ),
          ),
        ));
  }
}
