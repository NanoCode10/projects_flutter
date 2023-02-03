//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:porfolio_nano_v3/pages/aboutme.dart';
import 'package:porfolio_nano_v3/pages/contact.dart';
import 'package:porfolio_nano_v3/pages/homePages.dart';
import 'package:porfolio_nano_v3/pages/skills.dart';
import 'package:porfolio_nano_v3/posts/posts_1.dart';
import 'package:porfolio_nano_v3/posts/posts_2.dart';
import 'package:porfolio_nano_v3/posts/posts_3.dart';

var defaultBackgroundColor = Colors.grey[300];
var appBarColor = Color.fromARGB(255, 23, 81, 240);
var myAppBar = AppBar(
  backgroundColor: appBarColor,
  title: Text('< Nano Code > '),
  centerTitle: true,
  actions: [IconButton(onPressed: () {}, icon: Icon(Icons.sunny))],
);

int selectedIndex = 0;
PageController pageController = PageController();

class MyCustomNavigationRail extends StatefulWidget {
  const MyCustomNavigationRail({Key? key}) : super(key: key);

  @override
  State<MyCustomNavigationRail> createState() => _MyCustomNavigationRailState();
}

class _MyCustomNavigationRailState extends State<MyCustomNavigationRail> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NavigationRail(
          onDestinationSelected: (int index) {
            setState(() {
              selectedIndex = index;
              pageController.animateToPage(index,
                  duration: Duration(milliseconds: 250),
                  curve: Curves.easeInOut);
            });
          },
          groupAlignment: 0,
          backgroundColor: Colors.grey,
          elevation: 5,
          selectedLabelTextStyle: const TextStyle(
            color: Colors.indigo,
          ),
          selectedIndex: selectedIndex,
          destinations: const [
            NavigationRailDestination(
                icon: Icon(Icons.home), label: Text('Home')),
            NavigationRailDestination(
                icon: Icon(Icons.feed), label: Text('About Me')),
            NavigationRailDestination(
                icon: Icon(Icons.rocket_launch), label: Text('Skills')),
            NavigationRailDestination(
                icon: Icon(Icons.phone_enabled), label: Text('Contact')),
          ],
          labelType: NavigationRailLabelType.all,
          unselectedLabelTextStyle: const TextStyle(),
        ),
        Expanded(
          child: PageView(
            controller: pageController,
            scrollDirection: Axis.vertical,
            onPageChanged: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            children: [
              homepage(),
              aboutme(),
              skills(),
              contact(),
            ],
          ),
        )
      ],
    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  // int selectedIndex = 0;
  // PageController pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    pageController.animateToPage(index,
        duration: Duration(seconds: 1), curve: Curves.bounceIn);
  }

  @override
  Widget build(BuildContext context) {
    print(selectedIndex);
    return Row(
      children: [
        BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: _onItemTapped,

          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.feed),
              label: 'About Me',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.rocket_launch),
              label: 'Skills',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.phone_enabled),
              label: 'Contact',
            ),
          ],

          // selectedItemColor: Colors.amber[800],
        ),
      ],
    );
  }
}
