import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Home.dart';
import 'Login.dart';
import 'Register.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  Widget home = FirstScreen();

  checkIfLogged() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString('token') != null){
      setState(() {
        home = Home();
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    checkIfLogged();
    return MaterialApp(
      title: "SetState management",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: home,
    );
  }
}

bool logged = false;

class FirstScreen extends StatelessWidget {

  BuildContext get context => null;
  @override
  Widget build(BuildContext context) {
    if(logged){
      return Home();
    }
    else {
      return Scaffold(
        body: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 200, 0, 0),
                  child: Image.asset('assets/logo07.png'),
                ),
                SizedBox(height: 200),
                FlatButton(
                  child: _registerUI,
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute<Null>(
                            builder: (BuildContext context) {
                              return new Register();
                            }));
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: FlatButton(
                    child: _animatedButtonUI,
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute<Null>(
                              builder: (BuildContext context) {
                                return new Login();
                              }));
                    },
                  ),
                )
              ],
            )),
      );
    }
  }
}

Widget get _registerUI => Container(
  height: 40,
  width: 270,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(100.0),
    border: new Border.all(
      color: Color(0xff44647D),
    ),
  ),
  child: Center(
    child: Text(
      'Zarejestruj',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Color(0xff44647D),
      ),
    ),
  ),
);

Widget get _animatedButtonUI => Container(
      height: 40,
      width: 270,
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

