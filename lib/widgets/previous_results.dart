import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'dart:io';

import '../models/result.dart';

class PreviousResults extends StatelessWidget {
  const PreviousResults({Key? key, required this.previousResults})
      : super(key: key);

  final List<Result> previousResults;

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text('Previous results'),
    );

    return Scaffold(
      appBar: appBar,
      body: (previousResults.isEmpty || previousResults.length == 0)
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "No results yet.",
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    "Try taking a picture of something.",
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                    child: ExpandablePanel(
                      header: Center(
                        child: Text(
                          "Result ${index + 1}",
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      collapsed: const Center(
                        child: Text(
                          "Expand to show results",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      expanded: Column(
                        children: [
                          Center(
                            child: Card(
                              child: Image.file(
                                File(previousResults[index].imgPath),
                              ),
                            ),
                          ),
                          ...previousResults[index].resultMap.map(
                                (e) => ListTile(
                                  title: Text('Tag: ${e["name"].toString()}'),
                                  subtitle: Text(
                                      'Confidence: ${((e["confidence"] as double) * 100).toStringAsFixed(2)} %'),
                                ),
                              ),
                        ],
                      ),
                    ),
                  );
              },
              itemCount: previousResults.length,
            ),
    );
  }
}
