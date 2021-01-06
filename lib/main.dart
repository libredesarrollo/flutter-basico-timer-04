import 'package:flutter/material.dart';
import 'dart:async';

import 'package:timer_04/model/count.dart';
import 'package:timer_04/stream/count_stream.dart';
import 'package:timer_04/widget/indicator.dart';
import 'package:timer_04/widget/my_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Count count = Count('0', 1.0);
  final countStream = CountStream();
  String startStopLabel = "Start";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF9C27B0),
            title: Text("Timer 04"),
          ),
          body: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: MyButton(
                      color: Color(0xFF7C4DFF),
                      onPressed: () {
                        countStream.setTime(30);
                        countStream.start();
                      },
                      text: "30 segundos",
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: MyButton(
                      color: Color(0xFF757575),
                      onPressed: () {
                        countStream.setTime(60);
                        countStream.start();
                      },
                      text: "1 minuto",
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: MyButton(
                      color: Color(0xFFBDBDBD),
                      onPressed: () {
                        countStream.setTime(120);
                        countStream.start();
                      },
                      text: "2 minutos",
                    )),
                  ],
                ),
                Expanded(
                    child: StreamBuilder(
                  initialData: count,
                  stream: countStream.stream(),
                  builder: (_, AsyncSnapshot snapshot) {
                    print("En el StreamBuilder");
                    print(snapshot);

                    if (snapshot.hasData) {
                      print("Tenemos data");
                      print(snapshot.data.percert);
                    }

                    return Indicador(
                        count: snapshot.hasData ? snapshot.data : count);
                  },
                )),
                Row(
                  children: [
                    Expanded(
                        child: MyButton(
                      color: Color(0xFF7B1FA2),
                      onPressed: startStop,
                      text: startStopLabel,
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: MyButton(
                      color: Color(0xFF212121),
                      onPressed: reset,
                      text: "Reiniciar",
                    )),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  void startStop() {
    if (countStream.getActive()) {
      countStream.stop();
      setState(() {
        startStopLabel = "Start";
      });
    } else {
      countStream.start();
      setState(() {
        startStopLabel = "Stop";
      });
    }
  }

  void reset() {
    setState(() {
      startStopLabel = "Stop";
    });
    countStream.reset();
  }
}
