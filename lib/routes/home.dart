import 'package:flutter/material.dart';

import '../managers/locale.dart' show LocaleManager;


class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {

    var locale = LocaleManager.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(locale.getString('APP_TITLE')),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Text(locale.getString('TEST_STRING')),
          ),
          Expanded(
            child: Image.asset('assets/images/sample_logo.png')
          )
        ]
      ),
    );
  }
}
