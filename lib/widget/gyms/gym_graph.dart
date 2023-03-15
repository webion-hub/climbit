import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GymChart extends StatefulWidget {
  const GymChart({super.key});

  @override
  State<GymChart> createState() => _GymChartState();
}

class _GymChartState extends State<GymChart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 225,
          child: SfCartesianChart(
            title: ChartTitle(
              text: 'Affluenza',
            ),
            primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(),
            series: <ChartSeries> [
              ColumnSeries <VisitData, String>(
                dataSource: getColumnData(),
                xValueMapper: (VisitData visit,_)=>visit.x,
                yValueMapper: (VisitData visit,_)=>visit.y,
              )
            ]
          ),
        )
      ],
    );
  }
}

class VisitData {
  String x;
  double y;
  
  VisitData(
    this.x,
    this.y,
  );
}
dynamic getColumnData() {
  List<VisitData> columnData = <VisitData>[
    VisitData('8.00', 0),
    VisitData('9.00', 2),
    VisitData('10.00', 3),
    VisitData('11.00', 4),
    VisitData('12.00', 3),
    VisitData('13.00', 5),
    VisitData('14.00', 6),
    VisitData('15.00', 6),
    VisitData('16.00', 7),
    VisitData('17.00', 9),
    VisitData('18.00', 15),
    VisitData('19.00', 22),
    VisitData('20.00', 23),
    VisitData('21.00', 14),
    VisitData('22.00', 8),
    VisitData('23.00', 0),
    VisitData('0.00', 0),
  ];

  return columnData;
}

