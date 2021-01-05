import 'package:flutter/material.dart';
import 'dart:async';

import 'package:timer_04/model/count.dart';
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
  Timer timer;
  int countTime;
  int stop;

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
                        stop = 30;
                        countTime = 0;
                        start();
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
                        stop = 60;
                        countTime = 0;
                        start();
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
                        stop = 120;
                        countTime = 0;
                        start();
                      },
                      text: "2 minutos",
                    )),
                  ],
                ),
                Expanded(
                    child: Indicador(
                  count: count,
                )),
                Row(
                  children: [
                    Expanded(
                        child: MyButton(
                      color: Color(0xFF7B1FA2),
                      onPressed: timer == null ? null : startStop,
                      text: startStopLabel,
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: MyButton(
                      color: Color(0xFF212121),
                      onPressed: timer == null ? null :reset,
                      text: "Reiniciar",
                    )),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  start() {
    startStopLabel = "Stop";
    if (timer != null) timer.cancel();

    timer = Timer.periodic(Duration(seconds: 1), (time) {
      //var timer = new
      countTime++;
      setState(() {
        count.tag = countTime.toString();
        count.percert = countTime / stop;
      });

      if (countTime >= stop) {
        time.cancel();
        setState(() {
          startStopLabel = "Start";
        });
      }
    });
  }

  startStop() {
    if (timer != null) {
      if (timer.isActive) {
        timer.cancel();
        setState(() {
           startStopLabel = "Start";
        });
      } else {
        start();
      }
    }
  }

  reset() {
    if (timer != null) {
      countTime = 0;
      start();
    }
  }
}
