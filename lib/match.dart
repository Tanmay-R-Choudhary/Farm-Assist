import 'package:flutter/material.dart';
import 'MatchData.dart';

class Match extends StatefulWidget {
  @override
  _MatchState createState() => _MatchState();
}

class _MatchState extends State<Match> {
  var remedyData = MatchData.remedyData;
  var searchDataList = MatchData.remedyData;
  TextEditingController textEditingController = TextEditingController();

  onSearch(String value) {
    setState(() {
      searchDataList = remedyData
          .where((element) =>
              element['type'].toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

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
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Container(
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    color: Colors.white),
                child: TextField(
                  controller: textEditingController,
                  decoration:
                      InputDecoration(hintText: "Type the plant name here"),
                  onChanged: onSearch,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: searchDataList.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    child: Wrap(
                      children: [
                        Card(
                          elevation: 5,
                          child: Container(
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Text(
                                    searchDataList[index]['title'],
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
                                    searchDataList[index]['symptoms'],
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
                                    searchDataList[index]['info'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 17.0,
                                        color: Colors.black87),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
