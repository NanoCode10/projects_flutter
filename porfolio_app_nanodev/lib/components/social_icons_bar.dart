import 'package:flutter/material.dart';
import 'package:porfolio_app_nanodev/components/social_icon.dart';
import 'package:porfolio_app_nanodev/utils/utils.dart';

class SocialIconsBar extends StatelessWidget {
  const SocialIconsBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 5,
      top: Utils.mdqh(context) * 0.2,
      child: SizedBox(
        height: 300,
        width: 35,
        child: Column(
          children: const [
            SocialIcon(imgAss: 'assets/images/twitter-circ.gif'),
            SocialIcon(imgAss: 'assets/images/instagram-icon.gif'),
            SocialIcon(imgAss: 'assets/images/linkedin-circ.gif'),
            SocialIcon(imgAss: 'assets/images/github-icon.gif'),
          ],
        ),
      ),
    );
  }
}
