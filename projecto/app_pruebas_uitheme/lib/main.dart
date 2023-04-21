import 'package:app_pruebas_uitheme/ui.theme/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.light;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (BuildContext context, Orientation orientation,
                DeviceType deviceType) =>
            MaterialApp(
              title: 'Flutter Demo',
              theme: themeDataLight,
              darkTheme: themeDataDark,
              themeMode: themeMode,
              home: MyHomePage(chageTheme),
            ));
  }

  chageTheme(ThemeMode themeMode) {
    setState(() {
      this.themeMode = themeMode;
    });
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  var changeModeCallBack;
  MyHomePage(this.changeModeCallBack, {super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    widget.changeModeCallBack(Theme.of(context).brightness == Brightness.light
        ? ThemeMode.dark
        : ThemeMode.light);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*  backgroundColor: Theme.of(context).colorScheme.inversePrimary,*/
      appBar: AppBar(
        title: const Text('Material Nano desing'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hola, esto es una prueba del Tema de colores.',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
