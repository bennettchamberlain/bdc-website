import 'package:bdc_website/archived-unused/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/rive_utils.dart';
import '../utils/utils.dart';

final Uri _url = Uri.parse('https://www.buymeacoffee.com/bchamberlain');

class AboutPageLayout extends StatelessWidget {
  const AboutPageLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        Size size = MediaQuery.of(context).size;
        if (size.width < mobileBreakpoint) {
          return AboutPageMobile();
        } else {
          return AboutPageDesktop();
        }
      },
    );
  }
}

class AboutPageMobile extends StatefulWidget {
  const AboutPageMobile({super.key});

  @override
  State<AboutPageMobile> createState() => _AboutPageMobileState();
}

class _AboutPageMobileState extends State<AboutPageMobile> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class AboutPageDesktop extends StatefulWidget {
  const AboutPageDesktop({super.key});

  @override
  State<AboutPageDesktop> createState() => _AboutPageDesktopState();
}

class _AboutPageDesktopState extends State<AboutPageDesktop>
    with SingleTickerProviderStateMixin {
  bool selectedNavigation = false;
  bool isSideMenuClosed = true;
  late AnimationController _animationController;
  late Animation animation;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 0)).then((value) => setState(() {
          selectedNavigation = true;
        }));
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200))
          ..addListener(() {
            setState(() {});
          });
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
            color: Colors.grey[800],
            child: Stack(
              children: [
                Positioned(
                  right: 310,
                  top: 25,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Color.fromARGB(255, 97, 24, 110);
                          }
                          return Colors.black; // Use the component's default.
                        },
                      ),
                    ),
                    onPressed: () async {
                      if (!await launchUrl(_url)) {
                        throw Exception('Could not launch $_url');
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text('Buy me a coffee (click here)',
                          style: TextStyle(
                              fontSize: 20, color: Colors.green[200])),
                    ),
                  ),
                )
              ],
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.fastOutSlowIn,
            right: isSideMenuClosed ? -250 : 0,
            width: 250,
            height: MediaQuery.of(context).size.height,
            child: const MenuDesktop(),
          ),
          Transform.translate(
            offset: Offset(animation.value * -250,
                0), //isSideMenuClosed ? Offset(0, 0) : Offset(-250, 0),
            child: Transform.scale(
              scale: isSideMenuClosed ? 1 : 0.8,
              child: ClipRRect(
                child: Container(
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 8, color: Colors.black)),
                                child: AnimatedContainer(
                                  width: selectedNavigation
                                      ? MediaQuery.of(context).size.width - 123
                                      : 0.0,
                                  duration: const Duration(milliseconds: 1600),
                                  curve: Curves.fastOutSlowIn,
                                  child: const SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 5.0,
                                          bottom: 8,
                                          left: 10,
                                          right: 10),
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
                                decoration: const BoxDecoration(
                                    border: Border(
                                        top: BorderSide(
                                            width: 8, color: Colors.black),
                                        right: BorderSide(
                                            width: 8, color: Colors.black),
                                        bottom: BorderSide(
                                            width: 8, color: Colors.black))),
                                child: TextButton(
                                  style: const ButtonStyle(
                                    splashFactory: InkRipple.splashFactory,
                                  ),
                                  onPressed: () {
                                    if (isSideMenuClosed) {
                                      _animationController.forward();
                                    } else {
                                      _animationController.reverse();
                                    }
                                    setState(() {
                                      isSideMenuClosed = !isSideMenuClosed;
                                    });
                                  },
                                  child: isSideMenuClosed
                                      ? const Icon(
                                          Icons.menu,
                                          size: 55,
                                          color: Colors.black,
                                        )
                                      : const Icon(
                                          Icons.arrow_forward_ios,
                                          size: 55,
                                          color: Colors.black,
                                        ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 1000,
                          ),
                          //Text("About"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
