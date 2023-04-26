import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final theme = Provider.of<ThemeChanger>(context);
    return FloatingActionButton(
        child: Theme.of(context).brightness == Brightness.dark
            ? const Icon(Icons.brightness_3)
            : const Icon(Icons.brightness_7),
        onPressed: () => {
              isDark
                  ? theme.setTheme(ThemeData.light())
                  : theme.setTheme(ThemeData.dark()),
            });
  }
}
