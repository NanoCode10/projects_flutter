import 'package:flutter/material.dart';
import 'package:todo_summer_supabase/home_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'supabasehandler.dart';

Future<void> main() async {
  await Supabase.initialize(
      url: 'https://ksshezmyjekxiitzzmmu.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imtzc2hlem15amVreGlpdHp6bW11Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzM2MTgzMDksImV4cCI6MTk4OTE5NDMwOX0.0pNEFpVgNy42aTWSCmf9hJGcRL-1Cf93EreI8wgkjN4');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
