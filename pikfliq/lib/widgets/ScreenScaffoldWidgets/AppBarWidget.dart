import 'package:flutter/material.dart';
import 'package:pikfliq/widgets/AboutModalWidget.dart'; // Ensure this import is correct

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
        MouseRegion(
          cursor: SystemMouseCursors.click, // Change the cursor to a pointer
          child: IconButton(
            icon: const Icon(Icons.question_mark, size: 50),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => const AboutModalWidget(),
              );
            },
          ),
        ),
      ],
      titleSpacing: NavigationToolbar.kMiddleSpacing,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
