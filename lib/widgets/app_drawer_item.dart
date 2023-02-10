import 'package:flutter/material.dart';

class AppDrawerItem extends StatelessWidget {
  const AppDrawerItem(
      {Key? key, required this.title, required this.icon})
      : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
