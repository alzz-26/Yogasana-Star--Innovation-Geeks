import 'package:flutter/material.dart';
import 'package:toycathon/healthcheck.dart';
import 'posturecheck.dart';
import 'myguide.dart';
import 'findevents.dart';
import 'postureplay.dart';
import 'music.dart';
import 'settings.dart';
import 'dart:core';
import 'healthcheck.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[100],
      appBar: AppBar(title: Center(child: Text('Home')), backgroundColor: Colors.brown.shade400, actions: <Widget>[
        IconButton(
          icon: Icon(Icons.settings),
          color: Colors.yellow.shade50,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsPage()),
            );
          },
        ),
      ]),
      body: Stack(children: <Widget>[
        Container(
          alignment: Alignment(-0.8, -0.6),
          child: GestureDetector(
            child: Image(
              image: AssetImage('images/PostureCheck.jpg'),
              width: 133,
              fit: BoxFit.cover,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PostureCheckPage()),
              );
            },
          ),
        ),
        Container(
          alignment: Alignment(0.8, -0.6),
          child: GestureDetector(
            child: Image(
              image: AssetImage('images/MyGuide.jpg'),
              width: 133,
              fit: BoxFit.cover,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyGuidePage()),
              );
            },
          ),
        ),
        Container(
          alignment: Alignment(-0.8, 0.6),
          child: GestureDetector(
            child: Image(
              image: AssetImage('images/FindEvents.jpg'),
              width: 140,
              fit: BoxFit.cover,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FindEventsPage()),
              );
            },
          ),
        ),
        Container(
          alignment: Alignment(0.8, 0.6),
          child: GestureDetector(
            child: Image(
              image: AssetImage('images/PosturePlay.jpg'),
              width: 130,
              fit: BoxFit.cover,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PosturePlayPage()),
              );
            },
          ),
        ),
        Container(
          alignment: Alignment(0.0, 0.0),
          child: GestureDetector(
            child: Image(
              image: AssetImage('images/Health.jpg'),
              width: 130,
              fit: BoxFit.cover,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HealthCheckPage()),
              );
            },
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MusicPage()),
          );
        },
        child: Icon(Icons.music_note_sharp),
        foregroundColor: Colors.black,
        backgroundColor: Colors.tealAccent[100],
      ),
    );
  }
}
