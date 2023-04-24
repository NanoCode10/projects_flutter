import 'package:flutter/material.dart';
import 'package:app_porfolio_nano_v4/pages/homePages.dart';
import 'package:app_porfolio_nano_v4/pages/skills.dart';
import 'package:app_porfolio_nano_v4/pages/contact.dart';
import 'package:app_porfolio_nano_v4/pages/aboutme.dart';

var defaultBackgroundColor = Colors.white;
var appBarColor = Color.fromARGB(255, 23, 81, 240);
var myAppBar = AppBar(
   backgroundColor: appBarColor,
  leadingWidth: 150,
  leading: Image.asset(
    'assets/img/logo_nano.png',
  ),
  actions: [IconButton(onPressed: () {}, icon: Icon(Icons.sunny))],
);

int selectedIndex = 0;
final PageController pageController = PageController();

class PageViwCustom extends StatefulWidget {
  const PageViwCustom({super.key});

  @override
  State<PageViwCustom> createState() => _PageViwCustomState();
}

class _PageViwCustomState extends State<PageViwCustom> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      scrollDirection: Axis.vertical,
      onPageChanged: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
      children: [
        homepage_desktop(),
        aboutme_desktop(),
        skills_desktop(),
        contact_desktop(),
      ],
    );
  }
}
