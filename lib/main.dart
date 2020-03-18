import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smarthome/UI/screens/loginscreen/login_screen.dart';

void main() {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
  ));
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // home: Home(),
    home: LoginScr(),
  ));
}
