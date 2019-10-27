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

    var queryData = MediaQuery.of(context, nullOk: true);
    if (queryData != null) {
      print('+=[ MediaQuery ]====================-');
      print('| Screen size: ${queryData.size}');
      print('| Pixel ratio: ${queryData.devicePixelRatio}');
      print('| Text  scale: ${queryData.textScaleFactor}');
      print('+------------------------------------');

      /* In case of SM G965N
        queryData: MediaQueryData(
          size: Size(320.0, 657.8) or (320.0, 609.8)
          | aspectRatio: 0.48648648648648646
          | isFinite: true
          | isInfinite: false
          | longestSide: 657.7777777777778
          | shortestSide: 320.0
          | runtimeType: Size 
          devicePixelRatio: 4.5, 
          textScaleFactor: 1.1, 
          platformBrightness: Brightness.light, 
          padding: EdgeInsets(0.0, 24.0, 0.0, 0.0), 
          viewPadding: EdgeInsets(0.0, 24.0, 0.0, 0.0), 
          viewInsets: EdgeInsets.zero, 
          physicalDepth: 1.7976931348623157e+308, 
          alwaysUse24HourFormat: false, 
          accessibleNavigation: false, 
          disableAnimations: false, 
          invertColors: false, 
          boldText: false
        )
      */
    }

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
      // App의 UI 형태를 지정
      SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

      Navigator.of(context).pushReplacementNamed('/home');
    });
  }
}
