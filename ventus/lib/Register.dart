import 'dart:convert';
import 'dart:math';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ventus/Home.dart';
import 'package:ventus/Login.dart';
import 'package:ventus/main.dart';
import 'package:http/http.dart' as http;

import 'category.dart';

class Register extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<Register> {

  String date = "Date";
  String dropdownValue = 'Male'.toUpperCase();
  bool switchOn = false;
  bool switchOn1 = false;
  bool switchOn2 = false;
  DateTime selectedDate = DateTime.now();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repasswordController = TextEditingController();
  final emaiController = TextEditingController();
  final locationController = TextEditingController();
  final nameController = TextEditingController();
  final messengerController = TextEditingController();

  checkIfLogged() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
      if(prefs.getString("token") != null){
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => Home()
        ));
      };

  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        date = selectedDate.year.toString() + "-" + selectedDate.month.toString() + "-" + selectedDate.day.toString();
      });
  }
  @override
  Widget build(BuildContext context) {
    checkIfLogged();
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
          child: Container(
            margin: EdgeInsets.only(bottom: 20),
            child: SingleChildScrollView(
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
                    controller: emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 5.0),
                        ),
                        labelText: 'Email'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Container(
                  height: 50,
                  width: 330,
                  child: TextField(
                    controller: locationController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 5.0),
                        ),
                        labelText: 'City'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Container(
                  height: 50,
                  width: 330,
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 5.0),
                        ),
                        labelText: 'Password'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Container(
                  height: 50,
                  width: 330,
                  child: TextField(
                    obscureText: true,
                    controller: repasswordController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 5.0),
                        ),
                        labelText: 'RePassword'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Container(
                  height: 50,
                  width: 330,
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 5.0),
                        ),
                        labelText: 'Name'),
                  ),
                ),
              ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: Container(
              height: 50,
              width: 330,
              decoration: BoxDecoration(
                border: new Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(date, style: TextStyle(color: Colors.grey[600]),),
                  ),),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: FlatButton(
                        onPressed: () => _selectDate(context),
                      child: _date,
                    ),
                  )
                ],
              )
            ),
          ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Container(
                  height: 50,
                  width: 330,
                  child: TextField(
                    controller: messengerController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 5.0),
                        ),
                        labelText: 'Messenger'),
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
                      items: <String>['Male'.toUpperCase(), 'Female'.toUpperCase()]
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
                      SizedBox(height: 10),
                      SizedBox(height: 0),
                    ]),
                    TableRow(children: [
                      SizedBox(height: 10),
                      SizedBox(height: 0),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                        child: Text("I'm 13 years old and accept terms of use".toUpperCase(),
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
                onPressed: () async {
                  if(!switchOn2){
                    showDialog(context: context,
                        builder: (BuildContext context){
                          return AlertDialog(
                            content: Text("Accept term of use"),
                          );
                        }
                    );
                  } else{
                    String url = "http://ventusapi.herokuapp.com/api/register";
                    var map = new Map<String, dynamic>();
                    map['password'] = passwordController.text;
                    map['email'] = emailController.text;
                    map['gender'] = dropdownValue;
                    map['location'] = locationController.text;
                    map['first_name'] = nameController.text;
                    map['birthday'] = date;
                    map['messenger'] = messengerController.text;

                    http.Response response = await http.post(
                      url,
                      body: map,
                    );

                    if(response.statusCode == 200){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => Login()
                      ));
                    }
                    else{
                      Map resp = json.decode(response.body.toString());
                      showDialog(context: context,
                          builder: (BuildContext context){
                            return AlertDialog(
                              content: Text(resp['error'].toString()),
                            );
                          }
                      );
                    }

                  }


                },
              )
        ],
      ),
            ),
          )),
    );
  }
}

Widget get _date => Container(
  height: 50,
  width: 100,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(100.0),
    color: Color(0xff44647D),
  ),
  child: Center(
    child: Text(
      'Choose Date',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  ),
);

Widget get _animatedButtonUI => Container(
  height: 50,
  width: 340,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(100.0),
    color: Color(0xff44647D),
  ),
  child: Center(
    child: Text(
      'Zarejestruj',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  ),
);
