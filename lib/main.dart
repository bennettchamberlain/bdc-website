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
      debugShowCheckedModeBanner: false,
      routes: [VWidget(path: '/', widget: const HomePageLayout())],
      title: 'BDC - 999',
      theme: ThemeData(
        fontFamily: 'Primetime',
        primarySwatch: Colors.purple,
      ),
    );
  }
}
