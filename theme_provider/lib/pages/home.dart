import 'package:flutter/material.dart';
import 'package:theme_provider/mytheme.dart';
import 'package:theme_provider/theme_service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WELCOME"),
        actions: [
          Consumer<ThemeService>(builder: (context, ThemeService theme, _) {
            return IconButton(
                onPressed: () {
                  theme.toggleTheme();
                },
                icon: Icon(theme.darkTheme! ? Icons.sunny : Icons.dark_mode));
          }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text("ooo"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Card(
                child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text("This line can change your life"))),
            ElevatedButton(onPressed: (() {}), child: Text("CLICK ME"))
          ],
        ),
      ),
    );
  }
}
