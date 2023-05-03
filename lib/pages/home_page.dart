import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bdc_website/components/button_box.dart';
import 'package:bdc_website/components/my_footer.dart';
import 'package:bdc_website/components/my_marquee.dart';
import 'package:bdc_website/components/my_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:marquee/marquee.dart';
import 'package:rive/rive.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/utils.dart';

final Uri _url = Uri.parse('https://www.buymeacoffee.com/bchamberlain');

class HomePageLayout extends StatelessWidget {
  const HomePageLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        Size size = MediaQuery.of(context).size;
        if (size.width < mobileBreakpoint) {
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

class _HomePageDesktopState extends State<HomePageDesktop>
    with SingleTickerProviderStateMixin {
  bool selectedNavigation = false;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0)).then((value) => setState(() {
          selectedNavigation = true;
        }));

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 110,
                    ),
                    //PUT EVERYTIHING HERE
                    Container(
                      height: 500,
                      decoration: BoxDecoration(border: Border.all(width: 8)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: 8, color: Colors.black))),
                            child: Image.asset("assets/images/headshot.jpg"),
                          ),
                          Expanded(
                            child: AnimatedContainer(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 8, color: Colors.black))),
                              height: selectedNavigation ? 500 : 0,
                              duration: Duration(milliseconds: 800),
                              child: Container(
                                  padding: EdgeInsets.all(15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      const Text(
                                        'Apps for',
                                        style: TextStyle(fontSize: 25),
                                      ),
                                      const SizedBox(
                                          width: 15.0, height: 100.0),
                                      DefaultTextStyle(
                                        style: const TextStyle(
                                          fontSize: 25.0,
                                          fontFamily: 'Helvetica',
                                        ),
                                        child: AnimatedTextKit(
                                          animatedTexts: [
                                            RotateAnimatedText('iOS',
                                                textStyle: TextStyle(
                                                    fontFamily:
                                                        "Helvetica-Bold")),
                                            RotateAnimatedText('Android',
                                                textStyle: TextStyle(
                                                    fontFamily:
                                                        "Helvetica-Bold")),
                                            RotateAnimatedText('Web',
                                                textStyle: TextStyle(
                                                    fontFamily:
                                                        "Helvetica-Bold")),
                                          ],
                                          onTap: () {
                                            print("Tap Event");
                                          },
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                    MyFooter(),
                  ],
                ),
                const MyNavigationBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
