import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
                padding: const EdgeInsets.only(left: 100.0, top: 200),
                child: Text(
                  "Hi 👋, I am Mariano Developer!!",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100.0, top: 150.0),
                child: Image(
                  image: AssetImage('assets/images/nanoAplaude.png'),
                  width: 310,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
<<<<<<< HEAD
              Row(
                children: [
                  Icon(
                    Icons.face_sharp,
                    size: 35,
                  ),
                  Icon(
                    Icons.link_sharp,
                    size: 35,
                  ),
                  Icon(
                    Icons.link_sharp,
                    size: 35,
                  )
                ],
=======
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Row(
                  children: [
                    Image(
                      image: AssetImage('assets/images/github.png'),
                      width: 35,
                    ),
                    Image(
                      image: AssetImage('assets/images/linkedin.png'),
                      width: 35,
                    ),
                    Image(
                      image: AssetImage('assets/images/twitter.png'),
                      width: 35,
                    ),
                  ],
                ),
>>>>>>> 60017983a5494ebe8f4064b6ad2636dfa6453d0f
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
