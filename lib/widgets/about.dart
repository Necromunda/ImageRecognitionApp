import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('About'),
    );

    return Scaffold(
      appBar: appBar,
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Image recognition app made by Johannes Rantapää for WHMP course",
              style: TextStyle(fontSize: 20,),
            ),
          ],
        ),
      ),
    );
  }
}
