import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material',
        home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double translateX = 0.0;
  double translateY = 0.0;
  double myWidth = 0;

  var numberDice = 1;
  Random random = Random();

  void _rolledDice() {
    setState(() {
      numberDice = random.nextInt(6) + 1;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Dice Rolled'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice Game App'),
        centerTitle: true,
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.all(55)),
              Image.asset(
                'assets/dice_$numberDice.png',
                width: 170,
              ),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Text(
                  'Dice Number: ${numberDice}',
                  style: TextStyle(fontSize: 35),
                ),
              ),
              /*   ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.lightBlue)),
                onPressed: _rolledDice,
                icon: const Icon(Icons.refresh),
                label: const Text('Roll'),
              ),*/
              Expanded(
                child: Row(
                  children: [
                    Padding(padding: EdgeInsets.all(5)),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.00),
                          color: Colors.blue[50]),
                      width: MediaQuery.of(context).size.width - 30,
                      height: 100,
                      child: GestureDetector(
                        onHorizontalDragUpdate: (event) async {
                          if (event.primaryDelta! > 10) {
                            _incTansXVal();
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            paymentSuccessful(),
                            myWidth == 0.0
                                ? Expanded(
                                    child: Center(
                                      child: Text(
                                        "Swipe to Game!!!",
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 20.00),
                                      ),
                                    ),
                                  )
                                : SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget paymentSuccessful() => Transform.translate(
        offset: Offset(translateX, translateY),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          curve: Curves.linear,
          width: 100 + myWidth,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.00),
            color: Colors.blue,
          ),
          child: myWidth > 70.0
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 30,
                    ),
                    Flexible(
                      child: Text(
                        " Game successful !!",
                        style: TextStyle(color: Colors.white, fontSize: 20.00),
                      ),
                    ),
                  ],
                )
              : Icon(
                  Icons.navigate_next,
                  color: Colors.white,
                  size: 50.00,
                ),
        ),
      );

  _incTansXVal() async {
    int canLoop = -1;
    for (var i = 0; canLoop == -1; i++)
      await Future.delayed(Duration(milliseconds: 1), () {
        setState(() {
          if (translateX + 1 <
              MediaQuery.of(context).size.width - (200 + myWidth)) {
            translateX += 1;
            _rolledDice();
            myWidth = MediaQuery.of(context).size.width - (135 + myWidth);
          } else {
            canLoop = 1;
          }
        });
      });
  }
}
