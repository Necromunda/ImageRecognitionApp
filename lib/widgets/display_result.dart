import 'package:flutter/material.dart';
import 'dart:io';

import '../models/result.dart';

class DisplayResult extends StatelessWidget {
  // const DisplayResult({Key? key, required this.imagePath, required this.result})
  const DisplayResult({Key? key, required this.result}) : super(key: key);

  // final String imagePath;
  final Result result;

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text('Results'),
    );
    final height = MediaQuery.of(context).size.height;
    final appBarHeight = appBar.preferredSize.height;

    return Scaffold(
      appBar: appBar,
      body: Card(
        child: Column(
          children: [
            Center(
              child: Container(
                height: (height * 0.5) - appBarHeight,
                child: Image.file(
                  File(result.imgPath),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              child: Container(
                height: (height * 0.5) - appBarHeight,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                          'Tag: ${result.resultMap[index]["name"].toString()}'),
                      subtitle: Text(
                          'Confidence: ${((result.resultMap[index]["confidence"] as double) * 100).toStringAsFixed(2)} %'),
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
