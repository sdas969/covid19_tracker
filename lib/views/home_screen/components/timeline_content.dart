import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TimelineContent extends StatelessWidget {
  const TimelineContent({super.key});

  @override
  Widget build(BuildContext context) {
    List<ChartSampleData> data = [
      ChartSampleData('Jan', 100),
      ChartSampleData('Feb', 150),
      ChartSampleData('Mar', 200),
      ChartSampleData('Apr', 300),
      ChartSampleData('May', 400),
    ];

    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              series: <ChartSeries>[
                SplineAreaSeries<ChartSampleData, String>(
                    dataSource: data,
                    xValueMapper: (ChartSampleData data, _) => data.x,
                    yValueMapper: (ChartSampleData data, _) => data.y)
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ChartSampleData {
  final String x;
  final double y;

  ChartSampleData(this.x, this.y);
}
