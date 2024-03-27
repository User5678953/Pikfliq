import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onToggleTheme;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const AppBarWidget({
    Key? key,
    required this.onToggleTheme,
    required this.scaffoldKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      actions: [
        SizedBox(
          width: 40.0, // Adjust the width as needed
          height: 40.0, // Adjust the height as needed
          child: IconButton(
            icon: const Icon(Icons.settings),
             onPressed: () => scaffoldKey.currentState?.openEndDrawer(), 
          ),
        ),
        SizedBox(
          width: 40.0, // Adjust the width as needed
          height: 40.0, // Adjust the height as needed
          child: IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: onToggleTheme,
          ),
        ),
      ],
      titleSpacing: NavigationToolbar.kMiddleSpacing,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
