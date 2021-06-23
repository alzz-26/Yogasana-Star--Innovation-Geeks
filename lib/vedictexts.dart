import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class VedicTextsPage extends StatelessWidget {
  _infoLink() async {
    const link = 'https://www.sirayoga.com/three-ancient-texts/';
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
        title: Center(child: Text('Vedic Text')),
        backgroundColor: Colors.brown[400],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 300,
                height: 30,
                child: Container(
                  color: Colors.teal,
                  child: Center(
                    child: Text(
                      'Something About Yogs',
                      style: TextStyle(
                        color: Colors.yellowAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 500,
                height: 190,
                child: Container(
                  //decoration: BoxDecoration(
                  //border: Border.all(color: Colors.black),
                  //borderRadius: BorderRadius.circular(1.0),
                  //),
                  color: Colors.lightBlue[100],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'The ancient roots of yoga philosophy and  practice lean on three main texts: The Bhagavad Gita , The Yoga Sutras of Patanjali, and The Hatha Yoga Paradipika. The latter two are the primary sourse for the practical knowledge of thethe Yoga technique.',
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(height: 5),
                      Expanded(
                        child: Text(
                        'While there are earlier mention of YOGA in the Upanishads, these are fleeting and do not privide us with a picture of the yoga practice.',
                        textAlign: TextAlign.justify,
                      ),),
                      SizedBox(height: 8),
                      SizedBox(
                        width: 90,
                        height: 30,
                        child: Container(
                          child: ElevatedButton(
                            child: Center(
                              child: Text('Read More'),
                            ),
                            onPressed: _infoLink,
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.grey[900]),
                              foregroundColor: MaterialStateProperty.all(Colors.yellowAccent),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 60),
              SizedBox(
                width: 300,
                height: 30,
                child: Container(
                  color: Colors.teal,
                  child: Center(
                    child: Text(
                      'Shlokas And Their Meanings',
                      style: TextStyle(
                        color: Colors.yellowAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 500,
                height: 200,
                child: Card(
                  color: Colors.orange[200],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'sarvaṃ paravaśaṃ duḥkhaṃ sarvamātmavaśaṃ sukham। \netad vidyāt samāsena lakṣaṇaṃ sukhaduḥkhayoḥ॥',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: Text(
                          'Everything that is in other’s control is painful.\nAll that is in self-control is happiness.\nThis is the definition of happiness and pain in short.​',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
