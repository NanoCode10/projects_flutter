import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nanoapp_the_wall/auth/auth.dart';
import 'package:nanoapp_the_wall/theme/mytheme.dart';
import 'package:provider/provider.dart';
import 'package:nanoapp_the_wall/firebase_options.dart';
import 'package:nanoapp_the_wall/theme/dark_theme.dart';
import 'package:nanoapp_the_wall/theme/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeChanger(ThemeData.dark())),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.getTheme(),
      darkTheme: darkTheme,
      home: const AuthPage(),
    );
  }
}
