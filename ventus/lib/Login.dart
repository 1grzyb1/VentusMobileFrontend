import 'package:flutter/material.dart';
import 'package:ventus/main.dart';

import 'category.dart';

class Login extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<Login> {
  String dropdownValue = 'Male'.toUpperCase();
  bool switchOn = false;
  bool switchOn1 = false;
  bool switchOn2 = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Image.asset('assets/logo07.png'),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Container(
                  height: 50,
                  width: 330,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 5.0),
                        ),
                        labelText: 'Login'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Container(
                  height: 50,
                  width: 330,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 5.0),
                        ),
                        labelText: 'Password'),
                  ),
                ),
              ),
              SizedBox(height: 200),
              FlatButton(
                child: _animatedButtonUI,
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute<Null>(builder: (BuildContext context) {
                        return new Category();
                      }));
                },
              )
            ],
          )),
    );
  }
}

Widget get _animatedButtonUI => Container(
  height: 50,
  width: 340,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(100.0),
    color: Color(0xff44647D),
  ),
  child: Center(
      child: Text(
        'Zaloguj',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
  ),
);
