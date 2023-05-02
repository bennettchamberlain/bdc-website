import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';
import '../utils/providers.dart';
import 'button_box.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({super.key});

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  bool selectedNavigation = false;

  @override
  void initState() {
    isSideMenuClosed.value = true;
    Future.delayed(const Duration(seconds: 0)).then((value) => setState(() {
          selectedNavigation = true;
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 8, color: Colors.black)),
              child: AnimatedContainer(
                width: selectedNavigation
                    ? MediaQuery.of(context).size.width - 136
                    : 0,
                duration: const Duration(milliseconds: 1600),
                curve: Curves.fastOutSlowIn,
                child: const SingleChildScrollView(
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
              decoration: const BoxDecoration(
                  border: Border(
                      top: BorderSide(width: 8, color: Colors.black),
                      right: BorderSide(width: 8, color: Colors.black),
                      bottom: BorderSide(width: 8, color: Colors.black))),
              child: TextButton(
                style: const ButtonStyle(
                  splashFactory: InkRipple.splashFactory,
                ),
                onPressed: () {
                  Future.delayed(const Duration(seconds: 0))
                      .then((value) => setState(() {
                            isSideMenuClosed.value = !isSideMenuClosed.value;
                          }));
                },
                child: isSideMenuClosed.value
                    ? const Icon(
                        Icons.menu,
                        size: 55,
                        color: Colors.black,
                      )
                    : const Icon(
                        Icons.arrow_downward,
                        size: 55,
                        color: Colors.black,
                      ),
              ),
            ),
          ],
        ),
        AnimatedContainer(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              left: isSideMenuClosed.value
                  ? BorderSide(width: 0, color: Colors.white)
                  : BorderSide(width: 8, color: Colors.black),
              right: isSideMenuClosed.value
                  ? BorderSide(width: 0, color: Colors.white)
                  : BorderSide(width: 8, color: Colors.black),
              bottom: isSideMenuClosed.value
                  ? BorderSide(width: 0, color: Colors.white)
                  : BorderSide(width: 8, color: Colors.black),
            ),
          ),
          width: 200,
          height: isSideMenuClosed.value ? 0 : 270,
          duration: const Duration(milliseconds: 800),
          curve: Curves.fastOutSlowIn,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Center(
              child: Container(
                color: Colors.white,
                child: Padding(
                    padding: EdgeInsets.only(
                        top: 5.0, bottom: 8, left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ButtonBox(
                          width: 150,
                          height: 50,
                          border: false,
                          text: "Home",
                          fontSize: 20,
                          alignCorL: false,
                          onPressed: () {
                            context.vRouter.to("/");
                          },
                        ),
                        ButtonBox(
                          width: 150,
                          height: 50,
                          border: false,
                          text: "About",
                          fontSize: 20,
                          alignCorL: false,
                          onPressed: () {
                            context.vRouter.to("/about");
                          },
                        ),
                        ButtonBox(
                          width: 150,
                          height: 50,
                          border: false,
                          text: "Projects",
                          fontSize: 20,
                          alignCorL: false,
                          onPressed: () {
                            context.vRouter.to("/projects");
                          },
                        ),
                        ButtonBox(
                          width: 150,
                          height: 50,
                          border: false,
                          text: "Blog",
                          fontSize: 20,
                          alignCorL: false,
                          onPressed: () {
                            context.vRouter.to("/blog");
                          },
                        ),
                        ButtonBox(
                          width: 150,
                          height: 50,
                          border: false,
                          text: "Contact",
                          fontSize: 20,
                          alignCorL: false,
                          onPressed: () {
                            context.vRouter.to("/contact");
                          },
                        ),
                      ],
                    )),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
