import 'package:flutter/material.dart';

import '../models/result.dart';

class PreviousResults extends StatefulWidget {
  const PreviousResults({Key? key, required this.previousResults}) : super(key: key);

  final List<Result>? previousResults;

  @override
  State<PreviousResults> createState() => _PreviousResultsState();
}

class _PreviousResultsState extends State<PreviousResults> {

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('Previous results'),
    );

    return Scaffold(
      appBar: appBar,
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Number of previous results ${widget.previousResults?.length}",
              style: TextStyle(fontSize: 20,),
            ),
          ],
        ),
      ),
    );
  }
}


// class PreviousResults extends StatelessWidget {
//   const PreviousResults({Key? key, required this.previousResults}) : super(key: key);
//
//   final List<Result>? previousResults;
//
//   @override
//   Widget build(BuildContext context) {
//     final appBar = AppBar(
//       title: Text('Previous results'),
//     );
//
//     return Scaffold(
//       appBar: appBar,
//       body: Container(
//         margin: EdgeInsets.all(10),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Number of previous results ${previousResults?.length}",
//               style: TextStyle(fontSize: 20,),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
