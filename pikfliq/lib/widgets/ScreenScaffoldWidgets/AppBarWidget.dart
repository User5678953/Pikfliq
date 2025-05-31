import 'package:flutter/material.dart';


class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onToggleTheme;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const AppBarWidget({
    super.key,
    required this.onToggleTheme,
    required this.scaffoldKey,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset('assets/PikLogo.png'),
      ),
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          icon: const Icon(Icons.settings, size: 50),
          onPressed: () => scaffoldKey.currentState?.openEndDrawer(),
        ),
        IconButton(
          icon: const Icon(Icons.brightness_6, size: 50),
          onPressed: onToggleTheme,
        ),
      ],
      titleSpacing: NavigationToolbar.kMiddleSpacing,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
