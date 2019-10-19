import 'package:flutter/material.dart';
import 'package:ventus/main.dart';

import 'category.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String dropdownValue = 'Mężczyzna';
  bool switchOn = false;
  bool switchOn1 = false;
  bool switchOn2 = false;

  @override
  Widget build(BuildContext context) {
    void _onSwitchChanged(bool variable) {
      setState(() {
        switchOn = variable;
      });
    }
    void _onSwitchChanged1(bool variable) {
      setState(() {
        switchOn1 = variable;
      });
    }
    void _onSwitchChanged2(bool variable) {
      setState(() {
        switchOn2 = variable;
      });
    }

    return Scaffold(
      body: Center(
          child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Image.asset('assets/logo07.png'),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
            child: Container(
              height: 50,
              width: 330,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 5.0),
                    ),
                    labelText: 'Imię'),
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
                    labelText: 'Miejsce zamieszkania'),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: Container(
              height: 50,
              width: 330,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1.1, color: Colors.grey[600]),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: DropdownButton<String>(
                  underline: SizedBox(),
                  value: dropdownValue,
                  icon: Padding(
                    padding: const EdgeInsets.fromLTRB(200, 0, 0, 0),
                    child: Icon(Icons.keyboard_arrow_down),
                  ),
                  iconSize: 24,
                  style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>['Mężczyzna', 'Kobieta']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 10, 0),
            child: Table(
              columnWidths: {1: FractionColumnWidth(.2)},
              children: [
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Text("Wyświetlaj moje zdjęcie z Facebooka",
                        style: TextStyle(color: Color(0xff44647D),
                            fontWeight: FontWeight.bold)),
                  ),
                  Switch(
                    onChanged: _onSwitchChanged,
                    value: switchOn,
                    activeColor: Colors.white,
                    activeTrackColor: Color(0xff44647D),
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: Colors.grey,
                  ),
                ]),
                TableRow(children: [
                  SizedBox(height: 10),
                  SizedBox(height: 0),
                ]),
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Text("Pokazuj tylko osoby w pobliżu",
                        style: TextStyle(color: Color(0xff44647D),
                        fontWeight: FontWeight.bold)),
                  ),
                  Switch(
                    onChanged: _onSwitchChanged1,
                    value: switchOn1,
                    activeColor: Colors.white,
                    activeTrackColor: Color(0xff44647D),
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: Colors.grey,
                  ),
                ]),
                TableRow(children: [
                  SizedBox(height: 10),
                  SizedBox(height: 0),
                ]),
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Text("Mam ukończone 13 lat i akceptuje warunki użytkowania",
                        style: TextStyle(color: Color(0xff44647D),
                            fontWeight: FontWeight.bold)),
                  ),
                  Switch(
                    onChanged: _onSwitchChanged2,
                    value: switchOn2,
                    activeColor: Colors.white,
                    activeTrackColor: Color(0xff44647D),
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: Colors.grey,
                  ),
                ]),
              ],
            ),
          ),
          SizedBox(height: 50),
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
    child: Icon(Icons.arrow_forward, color: Colors.white,)
  ),
);
