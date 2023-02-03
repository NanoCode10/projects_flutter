import 'package:flutter/material.dart';
import 'package:porfolio_nano_v3/constatns.dart';
import 'package:porfolio_nano_v3/pages/homePages.dart';
import 'package:porfolio_nano_v3/pages/aboutme.dart';
import 'package:porfolio_nano_v3/pages/skills.dart';
import 'package:porfolio_nano_v3/pages/contact.dart';

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({super.key});

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: myAppBar,
      /*  body: PageView(
        controller: pageController,
        scrollDirection: Axis.vertical,
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
          print(selectedIndex);
        },
        children: [
          homepage(),
          aboutme(),
          skills(),
          contact(),
        ],
        physics: NeverScrollableScrollPhysics(),
      ),*/
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
