import 'package:flutter/material.dart';
import 'package:nanoapp_the_wall/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  final void Function()? onProfileTap;
  final void Function()? onThemeTap;
  final void Function()? onSignOut;
  const MyDrawer({
    super.key,
    required this.onProfileTap,
    required this.onThemeTap,
    required this.onSignOut,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //header
              DrawerHeader(
                child: Icon(
                  Icons.person,
                  color: Theme.of(context).colorScheme.primary,
                  size: 64,
                ),
              ),

              //home list tile
              MyListTile(
                icon: Icons.home,
                text: 'H O M E',
                onTap: () => Navigator.pop(context),
              ),
              //profile list title
              MyListTile(
                icon: Icons.person,
                text: 'P R O F I L E',
                onTap: onProfileTap,
              ),
              //profile list title
              MyListTile(
                icon: Icons.brightness_3,
                text: 'D A R K  /  L I G H T',
                onTap: onThemeTap,
              ),
            ],
          ),

          //logout list tile
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(
              icon: Icons.logout,
              text: 'L O G O U T ',
              onTap: onSignOut,
            ),
          ),
        ],
      ),
    );
  }
}
