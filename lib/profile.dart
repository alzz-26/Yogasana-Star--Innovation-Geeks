import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[100],
      appBar: AppBar(
        title: Center(child: Text('Profile')),
        backgroundColor: Colors.brown.shade400,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text('  Name :'),
                SizedBox(width: 10,),
                Expanded(
                  child: TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Type Your Name',
                    ),
                  ),
                ),  
              ],
            ),
            SizedBox(height: 30,),
            Row(
              children: <Widget>[
                Text('  Email :'),
                SizedBox(width: 10,),
                Expanded(
                  child: TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Type Your Email',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30,),
            Row(
              children: <Widget>[
                Text('  Password :'),
                SizedBox(width: 10,),
                Expanded(
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Type Your Password',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}