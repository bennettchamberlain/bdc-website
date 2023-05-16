import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum BlogPosts {
  BlogPost1(
      title: "Blog Post 1",
      imagePath: "assets/images/pic2.jpeg",
      blogContent: "My name is bennett and this is what im about",
      path: "post-1"),
  BlogPost2(
      title: "Blog Post 2",
      imagePath: "assets/images/pic1.jpeg",
      blogContent: "My name is bennett and this is what im about",
      path: "post-2");

  //final IconData? iconData;
  final String title;
  final String? imagePath;
  final String? blogContent;
  final String path;

  const BlogPosts(
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
