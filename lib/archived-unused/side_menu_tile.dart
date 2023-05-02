import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:vrouter/vrouter.dart';

import 'animation_model.dart';

class SideMenuTile extends StatelessWidget {
  final RiveAsset menu;
  final VoidCallback press;
  final ValueChanged<Artboard> riveOnInit;
  final bool isActive;

  const SideMenuTile(
      {required this.menu,
      required this.press,
      required this.riveOnInit,
      required this.isActive,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24.0),
          child: Divider(color: Colors.white24, height: 1),
        ),
        Stack(
          children: [
            AnimatedPositioned(
              curve: Curves.fastOutSlowIn,
              duration: const Duration(milliseconds: 300),
              height: 56,
              width: isActive ? 280 : 0,
              left: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 97, 24, 110),
                ),
              ),
            ),
            ListTile(
              onTap: press,
              leading: SizedBox(
                height: 34,
                width: 34,
                child: RiveAnimation.asset(
                  menu.src,
                  artboard: menu.artboard,
                  onInit: riveOnInit,
                ),
              ),
              title: Text(
                menu.title,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
