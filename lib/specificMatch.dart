import 'package:flutter/material.dart';
import 'MatchData.dart';

class PredMatch extends StatefulWidget {
  final index;

  const PredMatch({Key key, this.index}) : super(key: key);
  @override
  _PredMatchState createState() => _PredMatchState();
}

class _PredMatchState extends State<PredMatch> {
  var remedyData = MatchData.remedyData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('Match Predictions'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.greenAccent, Colors.blueGrey])),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: ListView(children: [
              Container(
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                child: Wrap(children: [
                  Card(
                    elevation: 5,
                    child: Container(
                        child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text(
                            remedyData[widget.index]['title'],
                            style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                            textAlign: TextAlign.center,
                          ),
                          Divider(
                            height: 7.0,
                            thickness: 2.0,
                            color: Colors.grey[300],
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            "Symptoms",
                            style: TextStyle(
                              letterSpacing: 1.0,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 1.0,
                          ),
                          Text(
                            remedyData[widget.index]['symptoms'],
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 17.0,
                                color: Colors.black87),
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            "Information",
                            style: TextStyle(
                                letterSpacing: 1.0,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 1.0,
                          ),
                          Text(
                            remedyData[widget.index]['info'],
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 17.0,
                                color: Colors.black87),
                          ),
                        ],
                      ),
                    )),
                  ),
                ]),
              ),
            ])),
          ],
        ),
      ),
    );
  }
}
