import 'package:bdc_website/components/button_box.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

class MyFooter extends StatelessWidget {
  const MyFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 2,
          child: ButtonBox(
              width: 150,
              height: 50,
              border: false,
              text: "Home",
              fontSize: 20,
              alignCorL: true,
              onPressed: () {
                FirebaseAnalytics.instance
                    .logEvent(name: 'home_page_navigation');
                context.vRouter.to("/");
              }),
        ),
        SizedBox(
          width: 15,
        ),
        Flexible(
          flex: 2,
          child: ButtonBox(
              width: 150,
              height: 50,
              border: false,
              text: "About",
              fontSize: 20,
              alignCorL: true,
              onPressed: () {
                FirebaseAnalytics.instance
                    .logEvent(name: 'about_page_navigation');
                context.vRouter.to("/about");
              }),
        ),
        SizedBox(
          width: 15,
        ),
        Flexible(
          flex: 2,
          child: ButtonBox(
              width: 150,
              height: 50,
              border: false,
              text: "Projects",
              fontSize: 20,
              alignCorL: true,
              onPressed: () {
                FirebaseAnalytics.instance
                    .logEvent(name: 'projects_page_navigation');
                context.vRouter.to("/projects");
              }),
        ),
        SizedBox(
          width: 15,
        ),
        Flexible(
          flex: 2,
          child: ButtonBox(
              width: 150,
              height: 50,
              border: false,
              text: "Blog",
              fontSize: 20,
              alignCorL: true,
              onPressed: () {
                FirebaseAnalytics.instance
                    .logEvent(name: 'blog_page_navigation');
                context.vRouter.to("/blog");
              }),
        ),
        SizedBox(
          width: 15,
        ),
        Flexible(
          flex: 2,
          child: ButtonBox(
              width: 150,
              height: 50,
              border: false,
              text: "Contact",
              fontSize: 20,
              alignCorL: true,
              onPressed: () {
                FirebaseAnalytics.instance
                    .logEvent(name: 'contact_page_navigation');
                context.vRouter.to("/contact");
              }),
        ),
      ],
    );
  }
}
