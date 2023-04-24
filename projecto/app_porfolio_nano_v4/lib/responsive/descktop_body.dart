import 'package:app_porfolio_nano_v4/posts/post1.dart';
import 'package:flutter/material.dart';
import 'package:app_porfolio_nano_v4/constatns.dart';

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
      body: PageViwCustom(),
    );
  }
}
