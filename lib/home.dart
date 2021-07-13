import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';
import 'guide.dart';
import 'about.dart';
import 'match.dart';
import 'specificMatch.dart';
import 'camerascreen.dart';

class MyHomePage extends StatefulWidget {
  final List<CameraDescription> cameras;

  MyHomePage(this.cameras);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> _recognitions;
  String _model = "";
  String model = "MobileNet";
  int predIndex;
  String predOne = '';
  String percentageOne = '';

  @override
  void initState() {
    super.initState();
    onSelect(model);
  }

  loadModel() async {
    String res;
    switch (_model) {
      default:
        res = await Tflite.loadModel(
            model: "lib/assets/converted_model_mobnet.tflite",
            labels: "lib/assets/Labels.txt");

        break;
    }
    print(res);
  }

  onSelect(model) {
    setState(() {
      _model = model;
    });
    loadModel();
  }

  setRecognitions(outputs, imageheight, imagewidth) {
    setState(() {
      _recognitions = outputs;
      predOne = outputs[0]['label'];
      predIndex = outputs[0]['index'];
    });
  }

  String confidenceRounder(double confidence) {
    var num = (confidence * 100).toString();
    String answer = double.parse(num).toStringAsFixed(1);
    return answer;
  }

  @override
  Widget build(BuildContext context) {
    if (_recognitions == null) {
      setState(() {
        percentageOne = "";
      });
    } else {
      setState(() {
        percentageOne = confidenceRounder(_recognitions[0]['confidence']);
      });
    }
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
            centerTitle: true,
            title: Text(
              "FarmAssist",
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.greenAccent,
            bottom: TabBar(
              tabs: [
                Column(children: [
                  Tab(
                      icon: Icon(
                    Icons.home,
                    color: Colors.blueGrey,
                  )),
                  Text(
                    "Home",
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ]),
                Column(children: [
                  Tab(
                      icon: Icon(
                    Icons.book,
                    color: Colors.blueGrey,
                  )),
                  Text(
                    "Guide",
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ]),
                Column(children: [
                  Tab(
                      icon: Icon(
                    Icons.info_outline,
                    color: Colors.blueGrey,
                  )),
                  Text(
                    "About",
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ]),
                Column(children: [
                  Tab(
                      icon: Icon(
                    Icons.help,
                    color: Colors.blueGrey,
                  )),
                  Text(
                    "Remedies",
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ]),
              ],
            )),
        body: TabBarView(children: [
          Stack(
            children: [
              Camera(widget.cameras, _model, setRecognitions),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 200.0,
                  decoration: BoxDecoration(
                      border: Border.all(width: 5.0, color: Colors.white),
                      color: Colors.blueGrey,
                      boxShadow: [
                        BoxShadow(color: Colors.black, blurRadius: 10.0)
                      ],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50.0),
                          topRight: Radius.circular(50.0))),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            "$predOne :",
                            style: TextStyle(
                                color: Colors.greenAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            "$percentageOne%",
                            style: TextStyle(
                                color: Colors.greenAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
                        child: Divider(
                          color: Colors.grey,
                          height: 5.0,
                        ),
                      ),
                      RaisedButton.icon(
                          disabledColor: Colors.greenAccent,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PredMatch(
                                          index: predIndex,
                                        )));
                          },
                          icon: Icon(Icons.search),
                          label: Text(
                            "Match To Remedies",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey,
                            ),
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
          Guide(),
          About(),
          Match(),
        ]),
      ),
    );
  }
}
