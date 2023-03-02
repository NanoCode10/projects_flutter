import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class homepage_dcktop extends StatelessWidget {
  const homepage_dcktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.blueAccent,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 100.0),
                child: Text(
                  "Hi 👋, I am Mariano Developer!!",
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 150.0, top: 210.0),
                child: Image(
                  image: AssetImage('assets/images/nanopic.png'),
                  width: 600,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
