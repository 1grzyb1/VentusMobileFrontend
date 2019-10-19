import 'package:flutter/material.dart';
import 'package:ventus/main.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
  Color green = Color(0xff46B29D);
  Color red = Color(0xffFFAD6F);
  Color orange = Color(0xffFEB74E);
  Color blue = Color(0xff44647D);
    return Scaffold(
      body: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Image.asset('assets/logo07.png'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Wrap(
                    spacing: 10.0,
                    runSpacing: 20.0,
                    children: <Widget>[
                      SizedBox(
                        child: Container(
                          decoration: new BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                            border: new Border.all(
                              color: green,
                            ),
                          ),
                          child: Container(
                              child: new Text("Muzyka", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: green)),
                              margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Container(
                          decoration: new BoxDecoration(
                            color: red,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            child: new Text("Filmy", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
                            margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Container(
                          decoration: new BoxDecoration(
                            color: Color(0xffFEB74E),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            child: new Text("Informatyka", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
                            margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Container(
                          decoration: new BoxDecoration(
                            color: green,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            child: new Text("Książki", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
                            margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Container(
                          decoration: new BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                            border: new Border.all(
                              color: blue,
                            ),
                          ),
                          child: Container(
                            child: new Text("Matematyka", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: blue)),
                            margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Container(
                          decoration: new BoxDecoration(
                            color: blue,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            child: new Text("Sport", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
                            margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
