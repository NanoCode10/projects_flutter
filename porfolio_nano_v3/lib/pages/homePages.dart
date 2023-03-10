import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';

class homepage_dcktop extends StatelessWidget {
  const homepage_dcktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.blueAccent,
      // ignore: prefer_const_constructors

      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50.0, top: 200),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: DefaultTextStyle(
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).size.width / 30,
                        fontWeight: FontWeight.bold),
                    child: AnimatedTextKit(
                      repeatForever: true,
                      isRepeatingAnimation: true,
                      pause: const Duration(seconds: 4),
                      animatedTexts: [
                        TypewriterAnimatedText(
                            'Hi 👋, I am Mariano Developer!!',
                            textAlign: TextAlign.center,
                            textStyle: GoogleFonts.getFont(
                              'Delius',
                              color: Colors.black,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50.0, top: 150.0),
                child: Image(
                  image: const AssetImage('assets/images/nanoAplaude.png'),
                  width: MediaQuery.of(context).size.width / 3.5,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Row(
                  children: [
                    Image(
                      image: AssetImage('assets/images/github.png'),
                      width: 35,
                      color: Color.fromARGB(255, 23, 81, 240),
                    ),
                    Image(
                      image: AssetImage('assets/images/linkedin.png'),
                      width: 35,
                      color: Color.fromARGB(255, 23, 81, 240),
                    ),
                    Image(
                      image: AssetImage('assets/images/twitter.png'),
                      width: 35,
                      color: Color.fromARGB(255, 23, 81, 240),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );

    //return Container(
    //  color: Color.fromARGB(255, 241, 236, 236),
    //);
  }
}

class homepage_mobile extends StatelessWidget {
  const homepage_mobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 241, 236, 236),
    );
  }
}
