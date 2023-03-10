import 'package:flutter/material.dart';

class SocialIcon extends StatelessWidget {
  final String imgAss;
  const SocialIcon({Key? key, required this.imgAss}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      onPressed: () {},
      child: Image.asset(imgAss),
      //Image.asset('assets/images/icons8-upward-arrow.gif')
    );
  }
}
