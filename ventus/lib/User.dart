import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'Home.dart';
import 'category.dart';

class User extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<User> {
  Color blue = Color(0xff517193);
  Color lightBlue = Color(0xff91a5bb);
  Color green = Color(0xff46B29D);
  Color red = Color(0xffFFAD6F);
  Color orange = Color(0xffFEB74E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: blue),
        backgroundColor: Color(0xfff0f0f0),
        title: Image.asset(
          'assets/logo07.png',
          fit: BoxFit.cover,
          scale: 1.7,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: ListView(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 60,
                      width: 60,
                      child: Icon(
                        Icons.person,
                        color: blue,
                      ),
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        color: lightBlue,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        "Piast Bulgocki",
                        style: TextStyle(
                            color: blue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        "Góry sowie, Poland",
                        style: TextStyle(color: blue, fontSize: 10),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 2.0),
                                  child: Text(
                                    "89",
                                    style: TextStyle(
                                      color: blue,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      "Age",
                                      style: TextStyle(
                                          color: blue,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ),
                          margin: EdgeInsets.fromLTRB(0, 20, 30, 0),
                        ),
                        Container(
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 3.0),
                                  child: Text(
                                    "70%",
                                    style: TextStyle(
                                      color: blue,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "Match",
                                    style: TextStyle(
                                        color: blue,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                          margin: EdgeInsets.fromLTRB(30, 20, 0, 0),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(60, 30, 0, 0),
                      child: Table(
                        columnWidths: {1: FractionColumnWidth(.6)},
                        children: [
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 0, 20),
                              child: Text(
                                "Linkin Park",
                                style: TextStyle(
                                    color: blue, fontWeight: FontWeight.bold),
                              ),
                            ),
                            LinearPercentIndicator(
                              width: 160.0,
                              lineHeight: 14.0,
                              percent: 1,
                              backgroundColor: Color(0xffffdabf),
                              progressColor: orange,
                            ),
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 0, 20),
                              child: Text(
                                "glebogryzarki",
                                style: TextStyle(
                                    color: blue, fontWeight: FontWeight.bold),
                              ),
                            ),
                            LinearPercentIndicator(
                              width: 160.0,
                              lineHeight: 14.0,
                              percent: 0.8,
                              backgroundColor: Color(0xffffdabf),
                              progressColor: orange,
                            ),
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 0, 20),
                              child: Text(
                                "Majkarft Bomba",
                                style: TextStyle(
                                    color: blue, fontWeight: FontWeight.bold),
                              ),
                            ),
                            LinearPercentIndicator(
                              width: 160.0,
                              lineHeight: 14.0,
                              percent: 0.6,
                              backgroundColor: Color(0xffffdabf),
                              progressColor: orange,
                            ),
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 0, 20),
                              child: Text(
                                "pomidory",
                                style: TextStyle(
                                    color: blue, fontWeight: FontWeight.bold),
                              ),
                            ),
                            LinearPercentIndicator(
                              width: 160.0,
                              lineHeight: 14.0,
                              percent: 0.2,
                              backgroundColor: Color(0xffffdabf),
                              progressColor: orange,
                            ),
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 0, 20),
                              child: Text(
                                "Linkin Park",
                                style: TextStyle(
                                    color: blue, fontWeight: FontWeight.bold),
                              ),
                            ),
                            LinearPercentIndicator(
                              width: 160.0,
                              lineHeight: 14.0,
                              percent: 1,
                              backgroundColor: Color(0xffffdabf),
                              progressColor: orange,
                            ),
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 0, 20),
                              child: Text(
                                "glebogryzarki",
                                style: TextStyle(
                                    color: blue, fontWeight: FontWeight.bold),
                              ),
                            ),
                            LinearPercentIndicator(
                              width: 160.0,
                              lineHeight: 14.0,
                              percent: 0.8,
                              backgroundColor: Color(0xffffdabf),
                              progressColor: orange,
                            ),
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 0, 20),
                              child: Text(
                                "Majkarft Bomba",
                                style: TextStyle(
                                    color: blue, fontWeight: FontWeight.bold),
                              ),
                            ),
                            LinearPercentIndicator(
                              width: 160.0,
                              lineHeight: 14.0,
                              percent: 0.6,
                              backgroundColor: Color(0xffffdabf),
                              progressColor: orange,
                            ),
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 0, 20),
                              child: Text(
                                "pomidory",
                                style: TextStyle(
                                    color: blue, fontWeight: FontWeight.bold),
                              ),
                            ),
                            LinearPercentIndicator(
                              width: 160.0,
                              lineHeight: 14.0,
                              percent: 0.2,
                              backgroundColor: Color(0xffffdabf),
                              progressColor: orange,
                            ),
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 0, 20),
                              child: Text(
                                "Linkin Park",
                                style: TextStyle(
                                    color: blue, fontWeight: FontWeight.bold),
                              ),
                            ),
                            LinearPercentIndicator(
                              width: 160.0,
                              lineHeight: 14.0,
                              percent: 1,
                              backgroundColor: Color(0xffffdabf),
                              progressColor: orange,
                            ),
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 0, 20),
                              child: Text(
                                "glebogryzarki",
                                style: TextStyle(
                                    color: blue, fontWeight: FontWeight.bold),
                              ),
                            ),
                            LinearPercentIndicator(
                              width: 160.0,
                              lineHeight: 14.0,
                              percent: 0.8,
                              backgroundColor: Color(0xffffdabf),
                              progressColor: orange,
                            ),
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 0, 20),
                              child: Text(
                                "Majkarft Bomba",
                                style: TextStyle(
                                    color: blue, fontWeight: FontWeight.bold),
                              ),
                            ),
                            LinearPercentIndicator(
                              width: 160.0,
                              lineHeight: 14.0,
                              percent: 0.6,
                              backgroundColor: Color(0xffffdabf),
                              progressColor: orange,
                            ),
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 0, 20),
                              child: Text(
                                "pomidory",
                                style: TextStyle(
                                    color: blue, fontWeight: FontWeight.bold),
                              ),
                            ),
                            LinearPercentIndicator(
                              width: 160.0,
                              lineHeight: 14.0,
                              percent: 0.2,
                              backgroundColor: Color(0xffffdabf),
                              progressColor: orange,
                            ),
                          ]),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: blue,
        ),
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                height: 120,
                child: DrawerHeader(
                  child: Container(
                    child: Center(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Container(
                              height: 60,
                              width: 60,
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                color: blue,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 15, 0, 0),
                                child: Text(
                                  "Łukasz Stanisławowski",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 3, 0, 0),
                                child: Text(
                                  "Drogosławiec, Stęszew",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: lightBlue,
                  ),
                ),
              ),
              ListTile(
                title: Container(
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.home,
                        color: lightBlue,
                        size: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "HOME",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute<Null>(builder: (BuildContext context) {
                    return new Home();
                  }));
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Container(
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.person,
                        color: lightBlue,
                        size: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "PROFILE",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Container(
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.category,
                        color: lightBlue,
                        size: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "CATEGORIES",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute<Null>(builder: (BuildContext context) {
                    return new Category();
                  }));
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
        bottomNavigationBar:BottomAppBar(
          color: blue,
         child: Container(
          height: 50,
           child: FlatButton(
               onPressed: null,
               child: Text("Send Invitation", style: TextStyle(color: Colors.white, fontSize: 20,),)),
         ),
        )
    );
  }
}
