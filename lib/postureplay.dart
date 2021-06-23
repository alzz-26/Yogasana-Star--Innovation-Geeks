import 'package:flutter/material.dart';
import 'dart:math';


class PosturePlayPage extends StatefulWidget {
  @override
  _PosturePlayState createState() => _PosturePlayState();
}

class _PosturePlayState extends State<PosturePlayPage> {
  int faceNumber = 1;

  void changeFace() {
    setState(() {
      faceNumber = Random().nextInt(6) + 1;
      Future.delayed(const Duration(seconds: 1), () {
        return showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Challenge For You'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('You got number $faceNumber'),
                    Text('You have to do TadaSana for $faceNumber 0 seconds'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('I am Ready!'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[100],
      appBar: AppBar(
        title: Center(child: Text('Play')),
        backgroundColor: Colors.brown.shade400,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/DiceFace$faceNumber.jpg'),
                alignment: Alignment(0.0, -5.0),
              ),
            ),
          ),
          Container(
            alignment: Alignment(0.0, 0.8),
            child: ElevatedButton(
              child: Text('Press Me'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blueGrey[100]),
                foregroundColor: MaterialStateProperty.all(Colors.black),
                minimumSize: MaterialStateProperty.all(Size(30, 60)),
              ),
              onPressed: changeFace,
            ),
          ),
        ],
      ),
    );
  }
}
