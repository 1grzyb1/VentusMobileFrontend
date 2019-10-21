import 'package:flutter/material.dart';
import 'package:ventus/MySliderThumbShape.dart';
import 'package:ventus/RoundSliderTrackShape.dart';

import 'Home.dart';

class Choose extends StatefulWidget {
  @override
  ChooseScreen createState() => ChooseScreen();
}

class ChooseScreen extends State<Choose> {
  double _value = 0.5;
  @override
  Widget build(BuildContext context) {
    Color orange = Color(0xffFFAD6F);
    return Scaffold(
      body: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 80),
                child: Image.asset('assets/logo07.png'),
              ),
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: SizedBox(
                  child: Container(
                    height: 270 + 20*_value,
                    width: 270 + 20*_value,
                    decoration: new BoxDecoration(
                      color: orange,
                      shape: BoxShape.circle,
                      border: new Border.all(
                        width: 30 - 20*_value,
                        color: Color(0xffffdabf),
                      ),
                    ),
                    child: Container(
                      child: Center(child: new Text("Linkin park", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white))),
                      margin: EdgeInsets.fromLTRB(30, 10, 30, 10),

                    ),
                  ),
                ),
              ),
      Padding(
        padding: const EdgeInsets.only(top: 40),
        child: SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 11,
            trackShape: RoundSliderTrackShape(radius: 8),
            thumbShape: MySliderThumbShape(),
            inactiveTrackColor: Color(0xffffdabf),
            activeTrackColor: orange,
            thumbColor: Colors.white,
          ),
          child: Slider(
              value: _value,
              onChanged: (value) {
                setState(() {
                  _value = value;
                });
              }),
        ),
      ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: FlatButton(
                  child: _animatedButtonUI,
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute<Null>(builder: (BuildContext context) {
                          return new Home();
                        }));
                  },
                ),
              )
            ],
          ),
      )
    );
  }
}

Widget get _animatedButtonUI => Container(
  height: 50,
  width: 50,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(100.0),
    color: Color(0xff44647D),
  ),
  child: Center(
    child: Icon(Icons.arrow_forward, color: Colors.white,),
  ),
);

