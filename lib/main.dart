import 'package:bdc_website/modules/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';
import 'pages/home_page.dart';

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
          widget: const MenuPageLayout(),
        ),
        VWidget(
          path: '/portfolio',
          widget: const MenuPageLayout(),
        ),
        VWidget(
          path: '/contact',
          widget: const MenuPageLayout(),
        ),
      ],
      title: 'BDC - 999',
      theme: ThemeData(
        fontFamily: 'Primetime',
        primarySwatch: Colors.grey,
      ),
    );
  }
}
