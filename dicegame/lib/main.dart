import 'dart:math';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:dicegame/dashborard.dart';

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
  bool isFinished = false;
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

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
                child: SwipeableButtonView(
                    buttonText: "SLIDE TO GAME !!!",
                    buttonWidget: Container(
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.grey,
                      ),
                    ),
                    activeColor: Color(0xff3398F6),
                    isFinished: isFinished,
                    onWaitingProcess: () {
                      Future.delayed(Duration(seconds: 2), () {
                        setState(() {
                          isFinished = true;
                          _rolledDice();
                        });
                      });
                    },
                    onFinish: () async {
                      /* await Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: const DashboardScreen()));

                      setState(() {
                        isFinished = false;
                      });*/
                      setState(() {
                        _rolledDice();
                        isFinished = false;
                      });
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
