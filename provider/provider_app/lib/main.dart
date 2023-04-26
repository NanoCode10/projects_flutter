import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/providers/counter_provider.dart';
import 'package:provider_app/providers/theme.dart';
import 'package:provider_app/screen/home_scren.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeChanger(ThemeData.dark())),
      ChangeNotifierProvider(create: (_) => CounterProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Provider App',
      theme: theme.getTheme(),
      home: const HomeScreen(),
    );
  }
}
