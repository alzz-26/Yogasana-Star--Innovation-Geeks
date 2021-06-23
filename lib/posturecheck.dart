import 'dart:io';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speech/flutter_speech.dart';
import 'package:camerawesome/camerapreview.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/models/capture_modes.dart';
import 'package:camerawesome/models/sensors.dart';
import 'package:camerawesome/picture_controller.dart';
import 'package:path_provider/path_provider.dart';
import 'package:google_ml_kit/google_ml_kit.dart';



void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PostureCheckPage(),
  ));
}

const languages = const [
  const Language('English', 'en_US'),
  const Language('Hindi', 'hi_IN'),
];

class Language {
  final String name;
  final String code;

  const Language(this.name, this.code);
}

class PostureCheckPage extends StatefulWidget {
  final bool randomPhotoName;

  PostureCheckPage({this.randomPhotoName = true});

  @override
  PostureCheckState createState() => PostureCheckState();
}

class PostureCheckState extends State<PostureCheckPage> with TickerProviderStateMixin {

  final poseDetector = GoogleMlKit.vision.poseDetector();

  late String _lastPhotoPath;
  late final File file;

  ValueNotifier<Sensors> _sensor = ValueNotifier(Sensors.FRONT);
  ValueNotifier<CaptureModes> _captureMode = ValueNotifier(CaptureModes.PHOTO);
  ValueNotifier<Size> _photoSize = ValueNotifier(Size(500.0, 500.0));

  PictureController _pictureController = new PictureController();

  late List<Size> _availableSizes;

  late SpeechRecognition _speech;

  bool _speechRecognitionAvailable = false;
  bool _isListening = false;

  String transcription = '';
  String command = '';

  Language selectedLang = languages.first;

  String yogaPosture = 'VrikshasanaRight';



  @override
  initState() {
    super.initState();
    activateSpeechRecognizer();
  }

  void activateSpeechRecognizer() {
    print('_MyAppState.activateSpeechRecognizer... ');
    _speech = SpeechRecognition();
    _speech.setAvailabilityHandler(onSpeechAvailability);
    _speech.setRecognitionStartedHandler(onRecognitionStarted);
    _speech.setRecognitionResultHandler(onRecognitionResult);
    _speech.setRecognitionCompleteHandler(onRecognitionComplete);
    _speech.setErrorHandler(errorHandler);
    _speech.activate('en_US').then((res) {
      setState(() => _speechRecognitionAvailable = res);
    });
  }

  void start() => _speech.activate(selectedLang.code).then((_) {
    return _speech.listen().then((result) {
      print('_MyAppState.start => result $result');
      setState(() {
        _isListening = result;
      });
    });
  });

  void cancel() =>
      _speech.cancel().then((_) => setState(() => _isListening = false));

  void stop() => _speech.stop().then((_) {
    setState(() => _isListening = false);
  });

  void onSpeechAvailability(bool result) =>
      setState(() => _speechRecognitionAvailable = result);


  void onRecognitionStarted() {
    setState(() => _isListening = true);
  }

  void onRecognitionResult(String text) {
    print('_MyAppState.onRecognitionResult... $text');
    setState(() => transcription = text);
  }

  void onRecognitionComplete(String text) {
    print('_MyAppState.onRecognitionComplete... $text');
    setState(() => _isListening = false);
  }

  void errorHandler() => activateSpeechRecognizer();

  void dispose() async {
    _photoSize.dispose();
    _captureMode.dispose();
    super.dispose();
  }

  Future auvi() async {
    await Future.delayed(Duration(seconds: 3));
    if (_speechRecognitionAvailable && !_isListening) {
      start();
      command = 'Listening';
      if (transcription == 'Capture') {
        await Future.delayed(Duration(seconds: 2));
        capture();
        command = 'Picture taken';
      }
      else if (transcription != 'Capture') {
        stop();
        command = 'Wrong command. Process ended' ;
      }
      else {
        await Future.delayed(Duration(seconds: 20));
        cancel();
      }
    }
  }

  Future capture() async {
    final Directory extDir = await getTemporaryDirectory();
    final testDir =
    await Directory('${extDir.path}/test').create(recursive: true);
    final String filePath = widget.randomPhotoName
        ? '${testDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg'
        : '${testDir.path}/photo_test.jpg';
    await _pictureController.takePicture(filePath);
    file = File(filePath);
    HapticFeedback.mediumImpact();
    _lastPhotoPath = filePath;
    setState(() {});
    detection();
  }

  Future detection() async {

    final inputImage = InputImage.fromFilePath(file.path);

    final List<Pose> poses = await poseDetector.processImage(inputImage);

    late Pose pose;

    double getangle(PoseLandmark firstPoint, PoseLandmark midPoint, PoseLandmark lastPoint) {
      double result = atan2(lastPoint.y - midPoint.y, lastPoint.x - midPoint.x) - atan2(firstPoint.y - midPoint.y, firstPoint.x - midPoint.x);
      var degrees = result * 180.0/pi;
      degrees = degrees.abs();

      if (degrees > 180.0) {
        degrees = 360.0 - degrees;
      }
      return degrees;
    }

    late double score;


    for (pose in poses) {

      //double rightHip = getangle(pose.landmarks[PoseLandmarkType.rightShoulder]!, pose.landmarks[PoseLandmarkType.rightHip]!, pose.landmarks[PoseLandmarkType.rightKnee]!);
      double rightAnkle = getangle(pose.landmarks[PoseLandmarkType.rightKnee]!, pose.landmarks[PoseLandmarkType.rightAnkle]!, pose.landmarks[PoseLandmarkType.rightFootIndex]!);
      //double rightElbow = getangle(pose.landmarks[PoseLandmarkType.rightWrist]!, pose.landmarks[PoseLandmarkType.rightElbow]!, pose.landmarks[PoseLandmarkType.rightShoulder]!);
      //double rightKnee = getangle(pose.landmarks[PoseLandmarkType.rightHip]!, pose.landmarks[PoseLandmarkType.rightKnee]!, pose.landmarks[PoseLandmarkType.rightAnkle]!);
      //double rightShoulder = getangle(pose.landmarks[PoseLandmarkType.rightElbow]!, pose.landmarks[PoseLandmarkType.rightShoulder]!, pose.landmarks[PoseLandmarkType.rightHip]!);
      //double leftElbow = getangle(pose.landmarks[PoseLandmarkType.leftWrist]!, pose.landmarks[PoseLandmarkType.leftElbow]!, pose.landmarks[PoseLandmarkType.leftShoulder]!);
      double leftShoulder = getangle(pose.landmarks[PoseLandmarkType.leftElbow]!, pose.landmarks[PoseLandmarkType.leftShoulder]!, pose.landmarks[PoseLandmarkType.leftHip]!);
      double leftHip = getangle(pose.landmarks[PoseLandmarkType.leftShoulder]!, pose.landmarks[PoseLandmarkType.leftHip]!, pose.landmarks[PoseLandmarkType.leftKnee]!);
      double leftKnee = getangle(pose.landmarks[PoseLandmarkType.leftHip]!, pose.landmarks[PoseLandmarkType.leftKnee]!, pose.landmarks[PoseLandmarkType.leftAnkle]!);
      //double leftAnkle = getangle(pose.landmarks[PoseLandmarkType.leftKnee]!, pose.landmarks[PoseLandmarkType.leftAnkle]!, pose.landmarks[PoseLandmarkType.leftFootIndex]!);

      if (yogaPosture == 'VrikshasanaRight') {
        if (rightAnkle == 90.0) {
          score = 5;
        }
        else if (rightAnkle < 90.0 && rightAnkle >= 70.0) {
          score = 4;
        }
        else if (rightAnkle < 70.0 && rightAnkle >= 50.0) {
          score = 3;
        }
        else if (rightAnkle < 50.0 && rightAnkle >= 30.0) {
          score = 2;
        }
        else if (rightAnkle < 30.0 && rightAnkle >= 10.0) {
          score = 1;
        }
        else score = 0;
      }
      else if (yogaPosture == 'MarjaryasanaLeft') {
        if (leftHip == 90.0 && leftShoulder == 90.0 && leftKnee == 90.0) {
          score = 5;
        }
        else if (leftHip < 90.0 && leftHip >= 70.0 && leftShoulder < 90.0 && leftShoulder >= 70.0 && leftKnee < 90.0 && leftKnee >= 70.0) {
          score = 4;
        }
        else if (leftHip < 70.0 && leftHip >= 50.0 && leftShoulder < 70.0 && leftShoulder >= 50.0 && leftKnee < 70.0 && leftKnee >= 50.0) {
          score = 3;
        }
        else if (leftHip < 50.0 && leftHip >= 30.0 && leftShoulder < 50.0 && leftShoulder >= 30.0 && leftKnee < 50.0 && leftKnee >= 30.0) {
          score = 2;
        }
        else if (leftHip < 30.0 && leftHip >= 10.0 && leftShoulder < 30.0 && leftShoulder >= 10.0 && leftKnee < 30.0 && leftKnee >= 10.0) {
          score = 1;
        }
        else score = 0;
      }
      return showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Check Result'),
              content: SingleChildScrollView(
                child: Text('Your score is $score'),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('OKAY'),
                  onPressed: () {
                    poseDetector.close();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          }
      );
    }
  }


  Widget buildSizedScreenCamera() {
    return Positioned(
      top: 0,
      left: 0,
      bottom: 0,
      right: 0,
      child: Container(
        color: Colors.black,
        child: Center(
          child: Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: CameraAwesome(
              selectDefaultSize: (availableSizes) {
                this._availableSizes = availableSizes;
                return availableSizes[0];
              },
              captureMode: _captureMode,
              photoSize: _photoSize,
              sensor: _sensor,
              fitted: true,
              orientation: DeviceOrientation.portraitUp,
              onCameraStarted: () {
                HapticFeedback.mediumImpact();
              },
            ),
          ),
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Center(child: Text('Posture Check'),),
      ),
      body: Column(
        //fit: StackFit.loose,
        children: <Widget>[
          buildSizedScreenCamera(),
          SizedBox(height: 10,),
          DropdownButton <String>(
            value: yogaPosture,
            items: <String>[
              'VrikshasanaRight',
              'MarjaryasanaLeft',
            ].map<DropdownMenuItem<String>> ((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            hint: Text('Choose a posture first'),
            onChanged: (String? nvalue) {
              setState(() {
                yogaPosture = nvalue!;
              });
            },
          ),
          SizedBox(height: 10,),
          ElevatedButton(
            child: Center(child: Text('START'),),
            onPressed: auvi,
          ),
          Text(command),
        ],
      ),
    );
  }
}


