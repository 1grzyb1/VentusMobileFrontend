import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter/services.dart';
import 'Second.dart';

class Choose extends StatefulWidget {
  @override
  ChooseScreen createState() => ChooseScreen();
}

class ChooseScreen extends State<Choose> {
  double _value = 0.0;
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
              Padding(
                padding: const EdgeInsets.only(top: 65),
                child: SizedBox(
                  child: Container(
                    height: 270,
                    width: 270,
                    decoration: new BoxDecoration(
                      color: orange,
                      shape: BoxShape.circle,
                      border: new Border.all(
                        width: 20,
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
              Slider(
                  value: _value,
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                    });
                  }),
            ],
          ),
      )
    );
  }
}

Widget get _animatedButtonUI => Container(
  height: 40,
  width: 270,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(100.0),
    color: Color(0xff44647D),
  ),
  child: Center(
    child: Text(
      'CONTINUE WITH FACEBOOK',
      style: TextStyle(
        fontSize: 10.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  ),
);

