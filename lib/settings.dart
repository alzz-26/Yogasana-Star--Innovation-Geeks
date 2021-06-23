import 'dart:io';
import 'package:flutter/material.dart';
import 'profile.dart';
import 'language.dart';
import 'consult.dart';
import 'package:image_picker/image_picker.dart';


class SettingsPage extends StatefulWidget {
  @override
  SettingsState createState() => SettingsState();
}

class SettingsState extends State<SettingsPage> {

  final ImagePicker _picker = ImagePicker();
  late PickedFile pickedFile ;
  late File file ;

  void _onImageButtonPressed(ImageSource source,
      {BuildContext? context}) async {

    final pickedFile = await _picker.getImage(source: source,);
    setState(() {
      file = File(pickedFile!.path);
    });
  }

  change() {
    _onImageButtonPressed(ImageSource.gallery, context: context);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[100],
      appBar: AppBar(
        title: Center(child: Text('Settings')),
        backgroundColor: Colors.brown.shade400,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/Profile.jpg'),
                  radius: 50,
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(height: 20, width: 80, child: Center(child: ElevatedButton(onPressed: change, child: Center(child: Text('CHANGE'),)))),
              Divider(
                color: Colors.green[900],
                height: 10,
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(5),
                  children: <Widget>[
                    GestureDetector(
                      child: Container(
                        height: 80,
                        color: Colors.orange[200],
                        child: Center(child: Text('Profile')),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProfilePage()),
                        );
                      }
                    ),
                    GestureDetector(
                      child: Container(
                        height: 80,
                        color: Colors.orange[300],
                        child: Center(child: Text('Language')),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LanguagePage()),
                        );
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        height: 80,
                        color: Colors.orange[400],
                        child: Center(child: Text('Get Consulted')),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ConsultPage()),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}