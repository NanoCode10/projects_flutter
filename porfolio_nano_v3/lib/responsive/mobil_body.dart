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
  // int selectedIndex = 0;
  // final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: myAppBar,
      body: PageViwCustom(),
      bottomNavigationBar: MyCustomNavitacionBar(),
    );
  }
}
