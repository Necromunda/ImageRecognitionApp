import 'package:flutter/material.dart';

import './about.dart';
import './previous_results.dart';
import './app_drawer_item.dart';

import '../models/result.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key, required this.previousResults}) : super(key: key);

  final List<Result> previousResults;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // padding: EdgeInsets.zero,
        children: [
          Container(
            height: 150,
            child: const DrawerHeader(
              decoration: BoxDecoration(
                // color: Colors.indigo,
                image: DecorationImage(
                    image: AssetImage("assets/images/ai.png"),
                    fit: BoxFit.cover),
              ),
              child: null,
            ),
          ),
          ListTile(
            title: const AppDrawerItem(
                title: "About", icon: Icons.question_mark_rounded),
            onTap: () async {
              Navigator.pop(context);
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const About(),
                ),
              );
            },
          ),
          ListTile(
            title: const AppDrawerItem(
                title: "Previous results", icon: Icons.add_card),
            onTap: () async {
              Navigator.pop(context);
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PreviousResults(
                    previousResults: previousResults,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
