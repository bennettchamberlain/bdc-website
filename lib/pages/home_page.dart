import 'package:flutter/material.dart';

class HomePageLayout extends StatelessWidget {
  const HomePageLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        Size size = MediaQuery.of(context).size;
        if (size.width < 600) {
          return HomePageMobile();
        } else {
          return HomePageDesktop();
        }
      },
    );
  }
}

class HomePageMobile extends StatefulWidget {
  const HomePageMobile({super.key});

  @override
  State<HomePageMobile> createState() => _HomePageMobileState();
}

class _HomePageMobileState extends State<HomePageMobile> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class HomePageDesktop extends StatefulWidget {
  const HomePageDesktop({super.key});

  @override
  State<HomePageDesktop> createState() => _HomePageDesktopState();
}

class _HomePageDesktopState extends State<HomePageDesktop> {
  bool selectedNavigation = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 0)).then((value) => setState(() {
          selectedNavigation = true;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 8, color: Colors.black)),
                    child: AnimatedContainer(
                      width: selectedNavigation
                          ? MediaQuery.of(context).size.width - 123
                          : 0.0,
                      duration: const Duration(milliseconds: 1600),
                      curve: Curves.fastOutSlowIn,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 5.0, bottom: 8, left: 10, right: 10),
                          child: Text(
                            "BENNETT CHAMBERLAIN",
                            style: TextStyle(
                                fontFamily: "Primetime",
                                fontWeight: FontWeight.bold,
                                fontSize: 45),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 90,
                    width: 90,
                    //padding: EdgeInsets.all(19),
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(width: 8, color: Colors.black),
                            right: BorderSide(width: 8, color: Colors.black),
                            bottom: BorderSide(width: 8, color: Colors.black))),
                    child: IconButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.menu,
                          size: 55,
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
