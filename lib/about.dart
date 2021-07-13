import 'package:flutter/material.dart';
import 'AboutData.dart';

class About extends StatelessWidget {
  final aboutData = AboutData.getData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
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
                child: ListView.builder(
                  itemCount: aboutData.length,
                  itemBuilder: (context, index) {
                    return Container(
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
                                  aboutData[index]['title'],
                                  style: TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.greenAccent),
                                  textAlign: TextAlign.center,
                                ),
                                Divider(
                                  height: 7.0,
                                  thickness: 2.0,
                                  color: Colors.grey[300],
                                ),
                                Text(
                                  aboutData[index]['info'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15.0,
                                      color: Colors.black87),
                                )
                              ],
                            ),
                          )),
                        ),
                      ]),
                    );
                  },
                ),
              )
            ],
          )),
    );
  }
}
