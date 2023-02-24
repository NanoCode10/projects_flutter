//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:porfolio_nano_v3/pages/aboutme.dart';
import 'package:porfolio_nano_v3/pages/contact.dart';
import 'package:porfolio_nano_v3/pages/homePages.dart';
import 'package:porfolio_nano_v3/pages/skills.dart';
import 'package:porfolio_nano_v3/posts/posts_1.dart';
import 'package:porfolio_nano_v3/posts/posts_2.dart';
import 'package:porfolio_nano_v3/posts/posts_3.dart';

var defaultBackgroundColor = Colors.white;
var appBarColor = Color.fromARGB(255, 23, 81, 240);
var myAppBar = AppBar(
  backgroundColor: appBarColor,
  title: Text('<  Nano Code 10  > '),
  centerTitle: false,
  actions: [IconButton(onPressed: () {}, icon: Icon(Icons.sunny))],
);

int selectedIndex = 0;
final PageController pageController = PageController();

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
          backgroundColor: Color.fromARGB(255, 235, 235, 235),
          elevation: 5,
          selectedLabelTextStyle: const TextStyle(
            color: Color.fromARGB(255, 23, 81, 240),
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
        const VerticalDivider(thickness: 1, width: 1),
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
              homepage_dcktop(),
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

//Barra Navegavion iferior
class MyCustomNavitacionBar extends StatefulWidget {
  const MyCustomNavitacionBar({super.key});

  @override
  State<MyCustomNavitacionBar> createState() => _MyCustomNavitacionBarState();
}

class _MyCustomNavitacionBarState extends State<MyCustomNavitacionBar> {
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      pageController.animateToPage(index,
          duration: Duration(seconds: 1), curve: Curves.bounceIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Colors.grey,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.feed,
            color: Colors.grey,
          ),
          label: 'About Me',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.rocket_launch,
            color: Colors.grey,
          ),
          label: 'Skills',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.phone_enabled,
            color: Colors.grey,
          ),
          label: 'Contact',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.blue,
      onTap: _onItemTapped,
    );
  }
}

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
        homepage_mobile(),
        aboutme(),
        skills(),
        contact(),
      ],
    );
  }
}
