import 'package:flutter/material.dart';

import './about.dart';
import './previous_results.dart';

import '../models/result.dart';


class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key, required this.previousResults}) : super(key: key);

  final List<Result>? previousResults;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // padding: EdgeInsets.zero,
        children: [
          Container(
            height: 75,
            child: DrawerHeader(
              decoration: BoxDecoration(color: Colors.indigo),
              child: Text(
                "Image recognition app",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.question_mark_rounded),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                  child: Text(
                    "About",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
            onTap: () async {
              Navigator.pop(context);
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => About(),
                ),
              );
            },
          ),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.add_card),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                  child: Text(
                    "Previous results",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
            onTap: () async {
              Navigator.pop(context);
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PreviousResults(previousResults: previousResults,),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
