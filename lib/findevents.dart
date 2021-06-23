import 'package:flutter/material.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';



class FindEventsPage extends StatelessWidget {
  _formLink() async {
    const link = 'https://docs.google.com/forms/d/e/1FAIpQLSfJOAFn232AGFJ3qrmEmI20hM2zdO3lZY_cEpz5hOaXYhWZcQ/viewform';
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      throw 'Link Not Found';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red[100],
        appBar: AppBar(
          title: Center(child: Text('Events')),
          backgroundColor: Colors.brown.shade400,
        ),
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/Meditation.jpg'),
                  scale: 4.0,
                  alignment: Alignment(0.82, -0.7),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/LiveSessions.jpg'),
                  scale: 1.6,
                  alignment: Alignment(-0.8, 0.7),
                ),
              ),
            ),
            Container(
              alignment: Alignment(0.55, 0.8),
              child: ElevatedButton(
                child: Text('Live Sessions'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blueGrey[100]),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                  minimumSize: MaterialStateProperty.all(Size(10, 60)),
                ),
                onPressed: _formLink,
              ),
            ),
            Container(
              alignment: Alignment(-0.5, -0.3),
              child: ElevatedButton(
                child: Text('Meditation'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blueGrey[100]),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                  minimumSize: MaterialStateProperty.all(Size(10, 60)),
                ),
                onPressed: _formLink,
              ),
            ),
            Container(
              alignment: Alignment(-0.7, -0.7),
              child: Text(
                'Meditation Class \nDate- A.A.A \nPresenter- abcd',
                style: TextStyle(fontSize: 23),
              ),
            ),
            Container(
              alignment: Alignment(0.7, 0.5),
              child: Text(
                'Muscle Fitness \nDate- B.B.B \nPresenter- efgh',
                style: TextStyle(fontSize: 23),
              ),
            ),
          ],
        ));
  }
}
