// widgets/app_bar.dart
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      leading: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Icon(Icons.account_circle),
      ),
      title: const Center(
          child: Text('Bijak Task',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
      actions: const [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Icon(Icons.logout),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
