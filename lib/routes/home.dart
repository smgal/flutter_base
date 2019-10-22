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
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: <Widget>[
            Center(
              child: Text(locale.getString('TEST_STRING')),
            ),
            Expanded(
              child: Image.asset('assets/images/sample_logo.png')
            ),
            FlatButton(
              onPressed: _onBottomButtonPressed,
              // TODO: 컬러도 resource에서 받아 올 수 있도록
              color: Color.fromARGB(0xFF, 0x60, 0xA0, 0xFF),
              textColor: Color.fromARGB(0xFF, 0xFF, 0xF7, 0xE0),
              child: Text('Go to Logo')
            )
          ]
        ),
      )
    );
  }

  void _onBottomButtonPressed() {
    setState(() {
      Navigator.of(context).pushReplacementNamed('/app-logo');
    });
  }  
}
