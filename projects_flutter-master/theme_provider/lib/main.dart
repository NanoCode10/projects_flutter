import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/mytheme.dart';
import 'package:theme_provider/pages/home.dart';
import 'package:theme_provider/theme_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeService>(
      create: (context) => ThemeService(),
      child: Consumer(builder: (context, ThemeService theme, _) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Provider',
            theme: theme.darkTheme! ? darkTheme : lightTheme,
            home: HomePage());
      }),
    );
  }
}
