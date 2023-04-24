import 'package:flutter/material.dart';
import 'constatns.dart';
import 'package:app_porfolio_nano_v4/responsive/descktop_body.dart';
import 'package:app_porfolio_nano_v4/responsive/mobil_body.dart';
import 'package:app_porfolio_nano_v4/responsive/table_body.dart';
import 'package:app_porfolio_nano_v4/responsive/resposibe_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nanco Code 10 Pofolio',
      home: ResponsiveLayout(
        mobileBody: const MobileScaffold(),
        tabletBody: const TabletScaffold(),
        desktopBody: const DesktopScaffold(),
      ),
    );
  }
}
