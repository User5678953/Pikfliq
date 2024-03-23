import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      title: const Center(child: Text('Pikfliq', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24))), // Centered and stylized title
      elevation: Theme.of(context).appBarTheme.elevation,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}












































// import 'package:flutter/material.dart';
// import 'package:push_pin_v1/src/presentation/widgets/DrawerWidget.dart'; // Ensure this is correct

// // AppBarWidget that includes a drawer
// class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
//       title: Text('PushPin', style: Theme.of(context).appBarTheme.titleTextStyle),
//       elevation: Theme.of(context).appBarTheme.elevation,
//       // Integrate the custom drawer widget here
//       leading: IconButton(
//         icon: Icon(Icons.menu),
//         onPressed: () => Scaffold.of(context).openDrawer(),
//       ),
//     );
//   }

//   @override
//   Size get preferredSize => Size.fromHeight(kToolbarHeight);
// }
