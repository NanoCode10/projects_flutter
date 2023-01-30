import 'package:flutter/material.dart';
import 'package:porfolio_nano_v3/responsive/mobil_body.dart';
import 'package:porfolio_nano_v3/responsive/responsibe_layout.dart';
import 'package:porfolio_nano_v3/responsive/descktop_body.dart';
import 'package:porfolio_nano_v3/responsive/table_body.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: ResponsiveLayout(
        mobileBody: const MobileScaffold(),
        tabletBody: const TabletScaffold(),
        desktopBody: const DesktopScaffold(),
      ),
    );
  }
}
