import 'package:bdc_website/components/side_menu_tile.dart';
import 'package:bdc_website/models/animation_model.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:vrouter/vrouter.dart';

import '../utils/rive_utils.dart';
import '../utils/utils.dart';

class MenuPageLayout extends StatelessWidget {
  const MenuPageLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        Size size = MediaQuery.of(context).size;
        if (size.width < MobileBreakpoint) {
          return MenuMobile();
        } else {
          return MenuDesktop();
        }
      },
    );
  }
}

class MenuMobile extends StatefulWidget {
  const MenuMobile({super.key});

  @override
  State<MenuMobile> createState() => _MenuMobileState();
}

class _MenuMobileState extends State<MenuMobile> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class MenuDesktop extends StatefulWidget {
  const MenuDesktop({super.key});

  @override
  State<MenuDesktop> createState() => _MenuDesktopState();
}

class _MenuDesktopState extends State<MenuDesktop> {
  RiveAsset selectedMenu = navButtons.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: 250,
        height: double.infinity,
        color: Colors.black,
        child: Column(
          children: [
            Image.asset('/images/headshot.jpg'),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, top: 32, bottom: 16),
              child: Text(
                'Browse'.toUpperCase(),
                style: TextStyle(
                  color: Colors.grey[100],
                  fontFamily: "Primetime",
                  fontSize: 20,
                ),
              ),
            ),
            ...navButtons.map(
              (menu) => SideMenuTile(
                menu: menu,
                riveOnInit: (artboard) {
                  StateMachineController controller =
                      RiveUtils.getRiveController(artboard,
                          stateMachineName: menu.stateMachineName);
                  menu.input = controller.findSMI("active") as SMIBool;
                },
                press: () {
                  menu.input!.change(true);
                  Future.delayed(Duration(seconds: 1), () {
                    menu.input!.change(false);
                  });
                  setState(() {
                    selectedMenu = menu;
                  });
                  if (selectedMenu.title == 'Home') {
                    context.vRouter.to('/');
                  }
                  if (selectedMenu.title == 'About') {
                    context.vRouter.to('/about');
                  }
                  if (selectedMenu.title == 'Portfolio') {
                    context.vRouter.to('/portfolio');
                  }
                  if (selectedMenu.title == 'Contact') {
                    context.vRouter.to('/contact');
                  }
                },
                isActive: selectedMenu == menu,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
