import 'package:flutter/material.dart';
import 'vedictexts.dart';
import 'moodboard.dart';
import 'fitnesstips.dart';

class MyGuidePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red[100],
        appBar: AppBar(
          title: Center(child: Text('My Guide')),
          backgroundColor: Colors.brown.shade400,
        ),
        body: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment(0.0, -0.9),
              child: GestureDetector(
                child: Image(
                  image: AssetImage('images/VedicTexts.jpg'),
                  width: 140,
                  fit: BoxFit.cover,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VedicTextsPage()),
                  );
                },
              ),
            ),
            Container(
              alignment: Alignment(0.0, 0.0),
              child: GestureDetector(
                child: Image(
                  image: AssetImage('images/MoodBoard.jpg'),
                  width: 140,
                  fit: BoxFit.cover,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MoodBoardPage()),
                  );
                },
              ),
            ),
            Container(
              alignment: Alignment(0.0, 0.9),
              child: GestureDetector(
                child: Image(
                  image: AssetImage('images/FitnessTips.jpg'),
                  width: 140,
                  fit: BoxFit.cover,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FitnessTipsPage()),
                  );
                },
              ),
            ),
          ],
        )
    );
  }
}
