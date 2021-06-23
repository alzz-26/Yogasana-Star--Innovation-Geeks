import 'package:flutter/material.dart';

class HealthCheckPage extends StatefulWidget {
  @override
  _HealthCheckState createState() => _HealthCheckState();
}

class _HealthCheckState extends State<HealthCheckPage> {

  final List<String> issue = ['Back Pain', 'Blood Pressure'];
  final List<String> correct = ['BharatVajas Twsit', 'Shavasana'];
  final List<String> wrong = ['Boat Pose', 'Head Stand'];
  int _dialogHealth = 0;
  late String _titleIssue ;
  late String _contentCorrect ;
  late String _contentWrong ;

  _healthissue()  async {

    if (_dialogHealth == 0) {
      _titleIssue = issue[0];
      _contentCorrect = correct[0];
      _contentWrong = wrong[0];
    } else  {
      _titleIssue = issue[1];
      _contentCorrect = correct[1];
      _contentWrong = wrong[1];
    }

    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Mood: $_titleIssue'),
            content: SingleChildScrollView(
              child: Text('Do: $_contentCorrect\n Avoid: $_contentWrong'),
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
          title: Center(child: Text('Health Check')),
          backgroundColor: Colors.brown.shade400,
        ),
        body: ListView.separated(
          padding: EdgeInsets.all(5.0),
          itemCount: issue.length,
          separatorBuilder: (BuildContext context, int index) => const Divider(),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 100,
              child: ListTile(
                title: Center(child: Text('${issue[index]}', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25,),),),
                selected: index == _dialogHealth,
                tileColor: Colors.lightBlue[100],
                hoverColor: Colors.orange[200],
                selectedTileColor: Colors.lightBlue[100],
                onTap: () {
                  setState(() {
                    _dialogHealth = index;
                    return _healthissue();
                  });
                },
              ),
            );
          },
        )
    );
  }
}
