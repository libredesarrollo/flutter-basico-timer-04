import 'package:flutter/material.dart';

import 'package:percent_indicator/percent_indicator.dart';
import 'package:timer_04/model/count.dart';

class Indicador extends StatelessWidget {
  final Count count;

  const Indicador({@required this.count}) : super();

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 200.0,
      lineWidth: 8.0,
      percent: count.percert,
      center: Text(
        "${count.tag} segs",
        style: TextStyle(fontSize: 25, color: Color(0xFF9C27B0)),
      ),
      progressColor: Color(0xFF9C27B0),
      backgroundColor: Color(0xFFBDBDBD),
      circularStrokeCap: CircularStrokeCap.round,
    );
  }
}
