class Result {
  final String imgPath;
  final List<dynamic> resultMap;
  // final List<Map<String, String>> resultMap;

  Result({required this.imgPath, required this.resultMap});

  // factory Result.fromJson(
  //     String imgPath, Map<String, dynamic> parsedJson) {
  //   return Result(
  //     imgPath: imgPath,
  //     resultMap: List<Map<String, String>>.from(parsedJson['tags']).map((e) => e['confidence'].toString()).toList(),
  //   );
  // }
}
