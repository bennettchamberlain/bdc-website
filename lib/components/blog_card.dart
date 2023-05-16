import 'dart:math';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

import 'button_box.dart';

class BlogCard extends StatelessWidget {
  final String title;
  final String? imagePath;
  final String? blogContent;
  final String? buttonText;
  final String path;

  const BlogCard(
      {required this.title,
      required this.blogContent,
      required this.imagePath,
      this.buttonText,
      required this.path,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: EdgeInsets.all(10),
        decoration:
            BoxDecoration(border: Border.all(width: 8, color: Colors.black)),
        child: InkWell(
          splashColor: Color(
            (Random().nextDouble() * 0xFFFFFF).toInt(),
          ),
          onTap: () {
            // Navigate to the larger page.

            Navigator.pushNamed(context, '/blog-post+$title');
          },
          child: Row(
            children: [
              Image.asset(
                imagePath ?? "assets/images/headshot.jpg",
                width: 100,
                fit: BoxFit.cover,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 45),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      this.blogContent ?? "Empty Description",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      ButtonBox(
        mobile: false,
        width: MediaQuery.of(context).size.width,
        height: 50,
        border: false,
        text: "Learn More",
        fontSize: 30,
        alignCorL: true,
        onPressed: () {
          if (context.vRouter.path != "${this.path}") {
            FirebaseAnalytics.instance.logEvent(name: '${this.path}-event');
          }
          context.vRouter.to("${this.path}");
        },
      ),
      SizedBox(height: 30)
    ]);
  }
}
