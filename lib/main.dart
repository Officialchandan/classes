import 'package:flutter/material.dart';
import 'package:weatherapp/Activity/home.dart';
import 'package:weatherapp/Activity/loading.dart';

void main() {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, routes: {
      "/": (context) => Loading(),
      "/home": (context) => Home(),
      "/loading": (context) => Loading(),
    }),
  );
}
//*video 7 comlited  */
