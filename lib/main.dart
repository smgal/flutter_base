import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import './managers/locale.dart';
import './routes/app_logo.dart' show AppLogo;
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

      routes: {
        '/app-logo': (BuildContext context) => AppLogo(),
        '/home': (BuildContext context) => Home(),
      },

      localizationsDelegates: [
        LocaleDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        Locale('en', 'US'),
        Locale('ko', '')
      ],
      
      home: AppLogo(),
    );
  }
}
