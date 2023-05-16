import 'package:bdc_website/archived-unused/side_menu.dart';
import 'package:bdc_website/enums/blog_posts_enums.dart';
import 'package:bdc_website/enums/projects_enums.dart';
import 'package:bdc_website/pages/individual_blog_page.dart';
import 'package:bdc_website/pages/individual_project_page.dart';
import 'package:bdc_website/pages/wrong_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';
import 'firebase_options.dart';
import 'pages/about_page.dart';
import 'pages/blog_page.dart';
import 'pages/contact_page.dart';
import 'pages/home_page.dart';
import 'pages/projects_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return VRouter(
      mode: VRouterMode.history,
      debugShowCheckedModeBanner: false,
      routes: [
        VWidget(
          path: '/',
          widget: const HomePageLayout(),
        ),
        VWidget(
          path: '/about',
          widget: const AboutPageLayout(),
        ),
        VWidget(
          path: '/projects',
          widget: const ProjectsPageLayout(),
        ),
        VWidget(
          path: '/blog',
          widget: const BlogPageLayout(),
        ),
        VWidget(
          path: '/contact',
          widget: const ContactPageLayout(),
        ),
        //Wrong page route and wildcard route redirect
        VWidget(
          path: '/404',
          widget: const WrongPageLayout(),
        ),

        //-----------------------ALL of the blog posts------------------

        VWidget(
          path: '/blog/post-1',
          widget: const IndividualBlogPage(post: BlogPosts.BlogPost1),
        ),
        VWidget(
          path: '/blog/post-2',
          widget: const IndividualBlogPage(post: BlogPosts.BlogPost1),
        ),

        //-----------------------ALL of the project posts------------------

        VWidget(
          path: '/projects/project-1',
          widget: const IndividualProjectPage(post: ProjectPosts.ProjectPost1),
        ),
        VWidget(
          path: '/projects/project-2',
          widget: const IndividualProjectPage(post: ProjectPosts.ProjectPost2),
        ),

        VRouteRedirector(path: '*', redirectTo: '/404')
      ],
      title: 'BDC - 999',
      theme: ThemeData(
        fontFamily: 'Helvetica',
        primarySwatch: Colors.grey,
      ),
    );
  }
}
