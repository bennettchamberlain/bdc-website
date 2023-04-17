import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:rive/rive.dart';

class MenuButton extends StatelessWidget {
  final VoidCallback press;
  final ValueChanged<Artboard> riveOninit;
  const MenuButton({super.key, required this.press, required this.riveOninit});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GestureDetector(
      onTap: press,
      child: Container(
          child: RiveAnimation.asset(
        "animations/menu_button.riv",
        artboard: "New Artboard",
        onInit: riveOninit,
      )),
    ));
  }
}
