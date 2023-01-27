import 'package:flutter/material.dart';
import 'package:porfolio_app_nanodev/utils/utils.dart';

class Presentation extends StatelessWidget {
  const Presentation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(children: [
          SizedBox(
            width: Utils.isMobile(context)
                ? Utils.mdqw(context)
                : Utils.mdqw(context) / 2,
            height: Utils.isMobile(context)
                ? Utils.mdqh(context) / 3
                : Utils.mdqh(context) - 70,
            child: Center(
              child: SizedBox(
                height: Utils.isMobile(context)
                    ? 200 / (Utils.mdqw(context) * 0.0025)
                    : 180,
                width:
                    Utils.isMobile(context) ? Utils.mdqw(context) * 0.95 : 380,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'Hi, I am Mariano Developer!!',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                //),
              ),
            ),
          ),
          SizedBox(
            width: Utils.isMobile(context)
                ? Utils.mdqw(context)
                : Utils.mdqw(context) / 2,
            height: Utils.isMobile(context)
                ? Utils.mdqh(context) / 2
                : Utils.mdqh(context) - 70,
            child: Padding(
              padding: Utils.isMobile(context)
                  ? const EdgeInsets.all(2.0)
                  : const EdgeInsets.only(
                      top: 200, bottom: 50, right: 250, left: 10),
              child: Image.asset(
                'assets/images/nanopic.png',
                alignment: Alignment.topRight,
              ),
            ),
          ),
        ]),
      ],
    );
  }
}
