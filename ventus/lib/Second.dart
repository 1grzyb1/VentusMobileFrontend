import 'package:flutter/material.dart';
import 'package:ventus/main.dart';

class Second extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        routes: <String, WidgetBuilder>{
          '/a': (BuildContext context) => MyApp(),
        });
  }
}