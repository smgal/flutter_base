import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../managers/locale.dart' show LocaleManager;


class AppLogo extends StatefulWidget {
  AppLogo({Key key}) : super(key: key);

  @override
  AppLogoState createState() => new AppLogoState();
}

class AppLogoState extends State<AppLogo> {

  bool _isAvailable = false;

  @override
  void initState() {
    super.initState();

    Timer(Duration(milliseconds: 100), () {
      setState(() {
        this._isAvailable = true;
      });
    });

    // TODO: 파라미터로 설정할 수 있게 하자

    // 상태바, 내비게이션 감추기(fullscreen)
    SystemChrome.setEnabledSystemUIOverlays([]);
    /*
    // 모두 보이기(일반 화면)
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    // 상태바 감추기
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    // 내비게이션바 감추기    
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    */
    
    this.goNext();
  }

  @override
  Widget build(BuildContext context) {
    var locale = LocaleManager.of(context);
    return Scaffold(
      primary: true,
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Color.fromARGB(0xFF, 0x40, 0x80, 0xFF),
          ),
          AnimatedOpacity(
            opacity: (_isAvailable) ? 1.0 : 0.0,
            duration: Duration(milliseconds: 1800),
            child: Container(
              child: Center(
                child: Text(
                  locale.getString('NOW_LOADING'),
                  style: TextStyle(
                    fontSize: 42.0,
                    color: Color.fromARGB(0xFF, 0xF8, 0x90, 0xB0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> goNext() async{
    Timer(Duration(milliseconds: 2500), () {
      // TODO: 외부 파라미터로 지정할 수 있게
      SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

      Navigator.of(context).pushNamed('/home');
    });
  }
}