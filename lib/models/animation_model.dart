import 'package:rive/rive.dart';

class RiveAsset {
  final String artboard, stateMachineName, title, src;
  late SMIBool? input;

  RiveAsset(this.src,
      {required this.artboard,
      required this.stateMachineName,
      required this.title,
      this.input});

  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveAsset> navButtons = [
  RiveAsset(
    "assets/animations/icon-set.riv",
    artboard: "HOME",
    stateMachineName: "HOME_interactivity",
    title: "Home",
  ),
  RiveAsset(
    "assets/animations/icon-set.riv",
    artboard: "USER",
    stateMachineName: "USER_Interactivity",
    title: "About",
  ),
  RiveAsset(
    "assets/animations/icon-set.riv",
    artboard: "SEARCH",
    stateMachineName: "SEARCH_Interactivity",
    title: "Portfolio",
  ),
  RiveAsset(
    "assets/animations/icon-set.riv",
    artboard: "CHAT",
    stateMachineName: "CHAT_Interactivity",
    title: "Contact",
  ),
];
