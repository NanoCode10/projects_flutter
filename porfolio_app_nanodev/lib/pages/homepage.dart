import 'package:flutter/material.dart';
import 'package:porfolio_app_nanodev/components/aboutme.dart';
import 'package:porfolio_app_nanodev/components/presentation.dart';
import 'package:porfolio_app_nanodev/utils/utils.dart';
import 'package:porfolio_app_nanodev/components/natbar_action.dart';
import 'package:porfolio_app_nanodev/utils/constants.dart';
import 'package:porfolio_app_nanodev/models/project_model.dart';
import 'package:porfolio_app_nanodev/components/my.drawer.dart';
import 'package:porfolio_app_nanodev/components/social_icons_bar.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final ScrollController myScrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.all(0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Padding(padding: const EdgeInsets.all(0.0)),
              Expanded(
                child: const Text(
                  '< Nano Code >',
                  style: TextStyle(
                    fontSize: 22,
                    color: Color(0xff4756df),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: IconButton(
                  padding: const EdgeInsets.only(left: 100),
                  onPressed: () {},
                  icon: Icon(Icons.sunny),
                  color: Color(0xff4756df),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        toolbarHeight: 66,
        elevation: 2,
        actions: [
          Utils.isMobile(context)
              ? Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    icon: const Icon(
                      Icons.menu,
                      color: Color(0xFf4756DF),
                      size: 30,
                    ),
                    onPressed: () {
                      _scaffoldKey.currentState!.openEndDrawer();
                    },
                  ),
                )
              : NatbarAction(
                  sc: myScrollController,
                ),
        ],
      ),
      endDrawer: Utils.isMobile(context)
          ? MyDrawer(
              sc: myScrollController,
            )
          : null,
      floatingActionButton: FloatingActionButton(
        mini: Utils.isMobile(context) ? true : false,
        onPressed: () {
          myScrollController.animateTo(
            10000,
            duration: const Duration(milliseconds: 1600),
            curve: Curves.easeIn,
          );
        },
        child: Image.asset('assets/images/down-arrow.png'),
      ),
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            controller: myScrollController,
            child: Column(children: const [
              Presentation(),
              SizedBox(height: 50),
              MoreAboutMe(),
            ]),
          ),
          const SocialIconsBar(),
        ],
      )),
    );
  }
}
