import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:ui';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('hi'), Locale('or')],
        path: 'languages', // <-- change the path of the translation files
        fallbackLocale: Locale('en'),
        useOnlyLangCode: true,
        saveLocale: false,
        child: LanguagePage()
    ),
  );
}


class LanguagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: Language()
    );
  }
}

class Language extends StatefulWidget{
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {

  var title = 'Language';
  var intro = 'Choose a language';


  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('title').tr()),
        backgroundColor: Colors.brown.shade400,
      ),
      backgroundColor: Colors.red[100],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('intro'.tr(), style: TextStyle(fontSize: 20),),
            SizedBox(height: 20,),
            Expanded(
              child: ListView(
                children: <Widget>[
                  GestureDetector(
                    child: Container(
                      height: 80,
                      color: Colors.lightBlue[50],
                      child: Center(child: Text('English'),),
                    ),
                    onTap: () async {
                      // ignore: deprecated_member_use
                      context.locale = Locale('en');
                      //title = tr('title');
                      //intro = tr('intro');
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      color: Colors.lightBlue[100],
                      height: 80,
                      child: Center(child: Text('हिंदी'),),
                    ),
                    onTap: () async {
                      // ignore: deprecated_member_use
                      context.locale = Locale('hi');
                      //title = tr('title');
                      //intro = tr('intro');
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      height: 80,
                      color: Colors.lightBlue[200],
                      child: Center(child: Text('ଓଡ଼ିଆ'),),
                    ),
                    onTap: () async {
                        // ignore: deprecated_member_use
                        context.locale = Locale('or');
                        //title = tr('title');
                        //intro = tr('intro');
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}