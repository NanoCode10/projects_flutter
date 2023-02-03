import 'package:flutter/material.dart';
import 'package:porfolio_nano_v3/constatns.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({super.key});

  @override
  State<DesktopScaffold> createState() => _DesktopScaffold();
}

class _DesktopScaffold extends State<DesktopScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: myAppBar,
      body: MyCustomNavigationRail(),
    );
  }
}
