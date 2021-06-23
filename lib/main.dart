import 'package:flutter/material.dart';
import 'dart:async';
import 'home.dart';

void main() => runApp(MaterialApp(
  title: 'Yogasana Star',
  home: OnBoardPage(),
  debugShowCheckedModeBanner: false,
));

//------------------------------------ON BOARD PAGE--------------------------------------//

class OnBoardPage extends StatefulWidget {
  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoardPage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/SplashScreen.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
