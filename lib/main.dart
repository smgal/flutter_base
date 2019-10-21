import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import './managers/locale.dart';
import './routes/home.dart' show Home;


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Base',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: [
        LocaleDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        Locale('en', 'US'),
        Locale('ko', '')
      ],
      
      home: Home(),
    );
  }
}
