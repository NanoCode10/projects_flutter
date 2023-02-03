import 'package:flutter/material.dart';
import 'package:porfolio_nano_v3/constatns.dart';
import 'package:porfolio_nano_v3/pages/homePages.dart';
import 'package:porfolio_nano_v3/pages/aboutme.dart';
import 'package:porfolio_nano_v3/pages/skills.dart';
import 'package:porfolio_nano_v3/pages/contact.dart';

class TabletScaffold extends StatefulWidget {
  const TabletScaffold({super.key});

  @override
  State<TabletScaffold> createState() => _TabletScaffold();
}

class _TabletScaffold extends State<TabletScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: myAppBar,
      bottomNavigationBar: MyBottomNavigationBar(),
      body: PageView(
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
    );
  }
}
