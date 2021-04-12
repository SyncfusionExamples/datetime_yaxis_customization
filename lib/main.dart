import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  return runApp(_ChartApp());
}

class _ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chart Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  _MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  List<EmployeeData> chartData = <EmployeeData>[
    EmployeeData(
        empName: 'Jack', checkinTime: DateTime(2020, 12, 22, 13, 05, 03)),
    EmployeeData(
        empName: 'Drake', checkinTime: DateTime(2020, 12, 22, 13, 18, 04)),
    EmployeeData(
        empName: 'Aron', checkinTime: DateTime(2020, 12, 22, 13, 22, 05)),
    EmployeeData(
        empName: 'John', checkinTime: DateTime(2020, 12, 22, 13, 33, 06)),
    EmployeeData(
        empName: 'Shawn', checkinTime: DateTime(2020, 12, 22, 13, 20, 07))
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: const Text('Syncfusion Flutter chart'),
        ),
        body: Center(
          child: Container(
            height: 500,
            width: 320,
            child: SfCartesianChart(
                backgroundColor: Colors.white,
                title: ChartTitle(text: 'Check-in time 22-Dec-2020'),
                axisLabelFormatter: (AxisLabelRenderDetails args) {
                  late String text;
                  if (args.axisName == 'primaryYAxis') {
                    print(args.value);
                    text = DateTime.fromMillisecondsSinceEpoch(
                                args.value.toInt())
                            .hour
                            .toString() +
                        ':' +
                        DateTime.fromMillisecondsSinceEpoch(args.value.toInt())
                            .minute
                            .toString() +
                        ':' +
                        DateTime.fromMillisecondsSinceEpoch(args.value.toInt())
                            .second
                            .toString();
                  } else {
                    text = args.text;
                  }
                  return ChartAxisLabel(text, args.textStyle);
                },
                // Also if you want to customize the data labels too to display the date time y-values then you can
                // customize the data labels using the onDataLabelRender event.
                onDataLabelRender: (args) {
                  args.text = DateTime.fromMillisecondsSinceEpoch(
                              int.parse(args.text))
                          .hour
                          .toString() +
                      ':' +
                      DateTime.fromMillisecondsSinceEpoch(int.parse(args.text))
                          .minute
                          .toString() +
                      ':' +
                      DateTime.fromMillisecondsSinceEpoch(int.parse(args.text))
                          .second
                          .toString();
                },
                primaryXAxis: CategoryAxis(),
                primaryYAxis: NumericAxis(
                    title: AxisTitle(text: 'HH:MM:SS'),
                    rangePadding: ChartRangePadding.additional,
                    name: 'primaryYAxis'),
                series: <ChartSeries<EmployeeData, String>>[
                  ColumnSeries<EmployeeData, String>(
                      dataSource: chartData,
                      xValueMapper: (EmployeeData data, _) => data.empName,
                      yValueMapper: (EmployeeData data, _) {
                        return data.checkinTime!.millisecondsSinceEpoch;
                      },
                      dataLabelSettings: DataLabelSettings(isVisible: true),
                      markerSettings: MarkerSettings(isVisible: true))
                ]),
          ),
        ));
  }
}

class EmployeeData {
  EmployeeData({this.empName, this.checkinTime});

  final String? empName;
  final DateTime? checkinTime;
}
