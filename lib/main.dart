import 'package:bdc_website/modules/side_menu.dart';
import 'package:bdc_website/pages/wrong_page.dart';
import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';
import 'pages/about_page.dart';
import 'pages/contact_page.dart';
import 'pages/home_page.dart';
import 'pages/portfolio_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return VRouter(
      mode: VRouterMode.history,
      debugShowCheckedModeBanner: false,
      routes: [
        VWidget(
          path: '/',
          widget: const HomePageLayout(),
        ),
        VWidget(
          path: '/about',
          widget: const AboutPageLayout(),
        ),
        VWidget(
          path: '/portfolio',
          widget: const PortfolioPageLayout(),
        ),
        VWidget(
          path: '/contact',
          widget: const ContactPageLayout(),
        ),
        VWidget(
          path: '/404',
          widget: const WrongPageLayout(),
        ),
        VRouteRedirector(path: '*', redirectTo: '/404')
      ],
      title: 'BDC - 999',
      theme: ThemeData(
        fontFamily: 'Primetime',
        primarySwatch: Colors.grey,
      ),
    );
  }
}
