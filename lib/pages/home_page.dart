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

class _HomePageMobileState extends State<HomePageMobile>
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 65),
                        //PUT EVERYTIHING HERE
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 8, color: Colors.black)),
                              child: Image.asset("assets/images/headshot.jpg"),
                            ),
                            SizedBox(height: 15),
                            AnimatedContainer(
                              curve: Curves.fastOutSlowIn,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 8, color: Colors.black)),
                              duration: Duration(milliseconds: 1600),
                              height: selectedNavigation ? 150 : 0,
                              width: size.width,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Container(
                                    width: 500,
                                    child: AnimatedTextKit(
                                      totalRepeatCount: 1,
                                      animatedTexts: [
                                        TyperAnimatedText(
                                            "Software Engineer\nProject Manager\nLifelong Student",
                                            speed: Duration(
                                              milliseconds: 100,
                                            ),
                                            textStyle: TextStyle(
                                                fontFamily: "Helvetica-Bold",
                                                fontSize: 20))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),

                        SizedBox(height: 25),
                        MyFooter(mobile: true),
                      ],
                    ),
                    const MyNavigationBar(mobile: true),
                  ],
                ),
              ),
              MyMarquee(
                  mobile: true,
                  text:
                      " Pixel perfect designs. Cross-platform applications. Full-stack websites. "),
            ],
          ),
        ),
      ),
    );
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 110,
                        ),
                        //PUT EVERYTIHING HERE
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 450,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 8, color: Colors.black)),
                              child: Image.asset("assets/images/headshot.jpg"),
                            ),
                            SizedBox(width: 15),
                            AnimatedContainer(
                              curve: Curves.fastOutSlowIn,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 8, color: Colors.black)),
                              duration: Duration(milliseconds: 1600),
                              height: selectedNavigation ? 505 : 0,
                              width: size.width - 495,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Container(
                                    width: 500,
                                    child: AnimatedTextKit(
                                      totalRepeatCount: 1,
                                      animatedTexts: [
                                        TyperAnimatedText(
                                            "Software Engineer\nProject Manager\nLifelong Student",
                                            speed: Duration(
                                              milliseconds: 100,
                                            ),
                                            textStyle: TextStyle(
                                                fontFamily: "Helvetica-Bold",
                                                fontSize: 50))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),

                        SizedBox(height: 25),
                        MyFooter(mobile: false),
                      ],
                    ),
                    const MyNavigationBar(mobile: false),
                  ],
                ),
              ),
              MyMarquee(
                  mobile: false,
                  text:
                      " Pixel perfect designs. Cross-platform applications. Full-stack websites. "),
            ],
          ),
        ),
      ),
    );
  }
}
