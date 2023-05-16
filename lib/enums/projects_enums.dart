import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum ProjectPosts {
  ProjectPost1(
      title: "Project Post 1",
      imagePath: "assets/images/pic3.jpeg",
      blogContent:
          "My name is bennett and this is what im about. this is project 1",
      path: 'project-1'),
  ProjectPost2(
      title: "Project Post 2",
      imagePath: "assets/images/headshot.jpg",
      blogContent:
          "My name is bennett and this is what im about. this is project 2",
      path: "project-2");

  //final IconData? iconData;
  final String title;
  final String? imagePath;
  final String? blogContent;
  final String path;

  const ProjectPosts(
      {
      // this.iconData,
      required this.title,
      this.imagePath,
      this.blogContent,
      required this.path});
}

// extension DrawingModeExtension on String {
//   toDrawingModeEnum() =>
//       DrawingMode.values.firstWhere((e) => e.toString() == 'DrawingMode.$this');
// }

// extension DrawingModeX on DrawingMode {
//   toRegularString() => toString().split('.')[1];
// }

// enum BrushType {
//   none,
//   splatter;
// }
