import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class homepage_dcktop extends StatelessWidget {
  const homepage_dcktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Container(
          //  child: SizedBox(
          child: Container(
            height: MediaQuery.of(context).size.height / 10,
            width: MediaQuery.of(context).size.width / 3,
            margin: EdgeInsets.only(bottom: 50, left: 90, right: 50, top: 50),
            color: Colors.deepOrange,
          ),
          // ),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 10,
          width: MediaQuery.of(context).size.width / 2.3,
          margin: EdgeInsets.only(bottom: 50, left: 50, right: 50, top: 50),
          color: Colors.green,
        ),
        //SizedBox(

        SizedBox(
          width: 500.0,
          height: 500.0,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                margin:
                    EdgeInsets.only(bottom: 50, left: 50, right: 50, top: 50),
                color: Colors.deepPurpleAccent,
              ),
            ],
          ),
        ),

        //   )
      ],
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
