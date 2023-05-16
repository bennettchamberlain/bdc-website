import 'package:bdc_website/components/blog_card.dart';
import 'package:bdc_website/components/button_box.dart';
import 'package:bdc_website/components/my_footer.dart';
import 'package:bdc_website/components/my_marquee.dart';
import 'package:bdc_website/components/my_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:marquee/marquee.dart';
import 'package:rive/rive.dart';
import 'package:url_launcher/url_launcher.dart';
import '../enums/blog_posts_enums.dart';
import '../utils/utils.dart';

final Uri _url = Uri.parse('https://www.buymeacoffee.com/bchamberlain');

class BlogPageLayout extends StatelessWidget {
  const BlogPageLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        Size size = MediaQuery.of(context).size;
        if (size.width < mobileBreakpoint) {
          return BlogPageMobile();
        } else {
          return BlogPageDesktop();
        }
      },
    );
  }
}

class BlogPageMobile extends StatefulWidget {
  const BlogPageMobile({super.key});

  @override
  State<BlogPageMobile> createState() => _BlogPageMobileState();
}

class _BlogPageMobileState extends State<BlogPageMobile> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class BlogPageDesktop extends StatefulWidget {
  const BlogPageDesktop({super.key});

  @override
  State<BlogPageDesktop> createState() => _BlogPageDesktopState();
}

class _BlogPageDesktopState extends State<BlogPageDesktop>
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
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 110,
                    ),

                    //PUT EVERYTIHING HERE
                    Container(
                      height: 1500,
                      decoration: BoxDecoration(border: Border.all(width: 8)),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          child: Column(children: [
                            ...BlogPosts.values.map(
                              (e) => BlogCard(
                                title: e.title,
                                blogContent: e.blogContent,
                                imagePath: e.imagePath,
                                buttonText: "Learn more",
                                path: e.path,
                              ),
                            )
                          ]),
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    //MyFooter(),
                  ],
                ),
                const MyNavigationBar(mobile: false),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
