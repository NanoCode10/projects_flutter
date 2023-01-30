import 'package:flutter/material.dart';

var defaultBackgroundColor = Colors.grey[300];
var appBarColor = Colors.grey[900];
var myAppBar = AppBar(
  backgroundColor: appBarColor,
  title: Text(' '),
  centerTitle: false,
);

var drawerTextColor = TextStyle(
  color: Colors.grey[600],
);
int _selectedIndex = 0;
var tilePadding = const EdgeInsets.only(left: 8.0, right: 8, top: 8);
var bottomNavigationBar = BottomNavigationBar(
    currentIndex: _selectedIndex,
    unselectedItemColor: Colors.grey,
    selectedItemColor: Colors.indigoAccent,
    // called when one tab is selected
    onTap: (int index) {
      //  setState(() {
      _selectedIndex = index;
      //  });
    },
    // bottom tab items
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.account_box), label: 'About Me'),
      BottomNavigationBarItem(icon: Icon(Icons.rocket_launch), label: 'Skills'),
      BottomNavigationBarItem(icon: Icon(Icons.phone_enabled), label: 'Contact')
    ]);
