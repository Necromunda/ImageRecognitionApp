import 'package:flutter/material.dart';
import 'dart:io';

import '../models/result.dart';

class DisplayResult extends StatelessWidget {
  const DisplayResult(
      {Key? key, required this.imagePath, required this.result})
      : super(key: key);

  final String imagePath;
  final Result result;

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('Image recognition'),
    );
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: appBar,
      body: Center(
        child: Column(
          children: [
            Container(
              height: (mediaQuery.size.height * 0.5) - appBar.preferredSize.height,
              width: double.infinity,
              child: Card(
                // margin: EdgeInsets.all(10),
                child: Image.file(File(imagePath)),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                height: (mediaQuery.size.height * 0.5) - appBar.preferredSize.height,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text('Tag: ${result.resultMap[index]["name"].toString()}'),
                        subtitle: Text('Confidence: ${((result.resultMap[index]["confidence"] as double) * 100).toStringAsFixed(2)} %'),
                      ),
                    );
                  },
                  itemCount: result.resultMap.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
