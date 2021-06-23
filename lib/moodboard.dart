import 'package:flutter/material.dart';

class MoodBoardPage extends StatefulWidget {
  @override
  _MoodBoardState createState() => _MoodBoardState();
}

class _MoodBoardState extends State<MoodBoardPage> {

  final List<String> mood = ['Depression', 'Anxiety', 'Calm'];
  final List<String> asana = ['AgniStambhasana or Fire Log Pose', 'Vrikshasana or Tree Pose', 'Savasana or Corpse Pose'];
  int _dialogMood = 0;
  late String _titleMood ;
  late String _contentAsana ;

  _moodBoard()  async {

    if (_dialogMood == 0) {
       _titleMood = mood[0];
       _contentAsana = asana[0];
    } else if (_dialogMood == 1) {
      _titleMood = mood[1];
      _contentAsana = asana[1];
    } else if (_dialogMood == 2) {
      _titleMood = mood[2];
      _contentAsana = asana[2];
    }

    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Mood: $_titleMood'),
            content: SingleChildScrollView(
              child: Text('Asana: $_contentAsana'),
            ),
            actions: <Widget> [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[100],
      appBar: AppBar(
        title: Center(child: Text('Mood Board')),
        backgroundColor: Colors.brown.shade400,
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(5.0),
        itemCount: mood.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 100,
            child: ListTile(
              title: Center(child: Text('${mood[index]}', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25,),),),
              selected: index == _dialogMood,
              tileColor: Colors.lightBlue[100],
              hoverColor: Colors.orange[200],
              selectedTileColor: Colors.lightBlue[100],
              onTap: () {
                setState(() {
                  _dialogMood = index;
                  return _moodBoard();
                });
              },
            ),
          );
        },
      )
    );
  }
}
