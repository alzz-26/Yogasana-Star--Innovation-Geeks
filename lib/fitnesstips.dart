import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class FitnessTipsPage extends StatelessWidget {

  _tipsLink() async {
    const link = 'https://www.womenshealthmag.com/fitness/a19930849/yoga-tips/';
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      throw 'Link Not Found';
    }
  }

  _dietLink() async {
    const link = 'https://origympersonaltrainercourses.co.uk/blog/yoga-diet';
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
        title: Center(child: Text('Fitness Tips')),
        backgroundColor: Colors.brown.shade400,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 300,
                height: 30,
                child: Container(
                  color: Colors.teal,
                  child: Center(
                    child: Text(
                      'Some Tips For Yoga',
                      style: TextStyle(
                        color: Colors.yellowAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              SizedBox(
                height: 110,
                width: 400,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.lightBlue[100],
                    border: Border.all(color: Colors.black, width: 3),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.lightBlue.shade600,
                        blurRadius: 5.0,
                        spreadRadius: 2.0,
                        offset: Offset(2.0, 2.0),
                      ),
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 3.0,
                        spreadRadius: 1.0,
                        offset: Offset(0.0, 0.0),
                      ),
                    ]
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(child: Text('  1. Be positive and give it a shot'),),
                      Expanded(child: Text('  2. Use a yoga mat'),),
                      Expanded(child: Text('  3. Wear loose and comfortable clothes'),),
                      Expanded(child: Text('  4. Start with easy posture and hold for small time'),),
                      Expanded(child: Text('  5. Maintain a very healthy diet for best effect of yoga'),),
                      Expanded(child: ElevatedButton(child: Center(child: Text('Read More'),), onPressed: _tipsLink,),),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
            ],
          ),
        )
      )
    );
  }
}