import 'dart:async';
import 'dart:convert';

// import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import './widgets/display_result.dart';
import './widgets/app_drawer.dart';
import './models/result.dart';

Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  // Force the app to be in portrait-mode
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp(camera: firstCamera));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.camera});

  final CameraDescription camera;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image recognition',
      theme: ThemeData(primarySwatch: Colors.indigo, fontFamily: 'Quicksand'),
      home: MyHomePage(
        title: 'Image recognition app',
        camera: camera,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.camera});

  final CameraDescription camera;
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  List<Result> results = [];

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  _analyseImg(XFile file) async {
    final uri = Uri.parse(
        "${dotenv.env['ENDPOINT']}vision/v3.2/analyze?visualFeatures=Tags");
    final headers = {
      'Content-Type': 'application/octet-stream',
      'Ocp-Apim-Subscription-Key': dotenv.env['KEY'].toString(),
    };
    Uint8List jsonBody = await file.readAsBytes();
    final encoding = Encoding.getByName('utf-8');

    Response response = await post(
      uri,
      headers: headers,
      body: jsonBody,
      encoding: encoding,
    );

    return response.body;
  }

  void _takePicture() async {
    try {
      await _initializeControllerFuture;

      final image = await _controller.takePicture();

      final Map<String, dynamic> response =
          jsonDecode(await _analyseImg(image));

      Result result = Result(imgPath: image.path, resultMap: response['tags']);

      results.add(result);

      if (!mounted) return;

      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DisplayResult(
            // imagePath: image.path,
            result: result,
          ),
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text(widget.title),
    );

    final height = MediaQuery.of(context).size.height;
    final appBarHeight = appBar.preferredSize.height;

    return Scaffold(
      appBar: appBar,
      drawer: AppDrawer(
        previousResults: results,
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              margin: const EdgeInsets.all(10),
              height: height - appBarHeight,
              child: CameraPreview(_controller),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: _takePicture,
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
