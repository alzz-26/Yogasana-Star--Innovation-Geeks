import 'package:flutter/material.dart';

class ConsultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[100],
      appBar: AppBar(
        title: Center(child: Text('Query')),
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
                Text('  How to contact you?'),
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
                Text('  Query Subject :'),
                SizedBox(width: 10,),
                Expanded(
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: '',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30,),
            Row(
              children: <Widget>[
                Text('  Let us know your query!'),
                SizedBox(width: 10,),
                Expanded(
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: '',
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