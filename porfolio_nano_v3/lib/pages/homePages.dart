import 'package:flutter/material.dart';

class homepage extends StatelessWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        SizedBox(
          child: Container(
            height: 100,
            width: 200,
            margin: EdgeInsets.only(bottom: 10),
            color: Colors.deepOrange,
          ),
        ),
      ],
    );

    //return Container(
    //  color: Color.fromARGB(255, 241, 236, 236),
    //);
  }
}
