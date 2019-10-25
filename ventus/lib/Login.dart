import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ventus/main.dart';
import 'dart:convert';
import 'Home.dart';
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
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  checkIfLogged() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString("token") != null){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Home()
      ));
    };

  }

  @override
  Widget build(BuildContext context) {
  checkIfLogged();
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
                    controller: emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 5.0),
                        ),
                        labelText: 'email'),
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
              SizedBox(height: 200),
              FlatButton(
                child: _animatedButtonUI,
                onPressed: () async {
                  String url = 'http://ventusapi.herokuapp.com/api/login_check';
                  Map<String, String> headers = {"Content-type": "application/json"};
//                  String json = '{"username": "'+ emailController.text +'", "password": "' + passwordController.text + '"}';
                  String json = '{"username": "' + emailController.text + '","password": "'+ passwordController.text +'"}';
                  Response response = await post(url, headers: headers, body: json);
                  Map resp = jsonDecode(response.body.toString());
                  if(response.statusCode == 200){
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.setString("token", resp['token'].toString());
                    prefs.setString("refresfToken", resp['refresh_token'].toString());
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => Category()
                    ));
                  }
                  else{
                    showDialog(context: context,
                        builder: (BuildContext context){
                          return AlertDialog(
                            content: Text("Bad email or password"),
                          );
                        }
                    );
                  }
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
