import 'package:books_api_demo/model/sales.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class LineChartDemo extends StatefulWidget {
  @override
  _LineChartDemoState createState() => _LineChartDemoState();
}

class _LineChartDemoState extends State<LineChartDemo> {

  List<charts.Series<Sales, int>> _seriesLineData;

  _salesData() {
  var salesData1 = [
  Sales(salesValue: 0,yearValue: 45),
  Sales(salesValue: 1,yearValue: 35),
  Sales(salesValue: 2,yearValue: 65),
  Sales(salesValue: 3,yearValue: 25),
  Sales(salesValue: 4,yearValue: 85),
  Sales(salesValue: 5,yearValue: 95),
  ];

   var salesData2 = [
  Sales(salesValue: 0,yearValue: 21),
  Sales(salesValue: 1,yearValue: 31),
  Sales(salesValue: 2,yearValue: 45),
  Sales(salesValue: 3,yearValue: 87),
  Sales(salesValue: 4,yearValue: 35),
  Sales(salesValue: 5,yearValue: 69),
  ];

   var salesData3 = [
  Sales(salesValue: 0,yearValue: 41),
  Sales(salesValue: 1,yearValue: 71),
  Sales(salesValue: 2,yearValue: 82),
  Sales(salesValue: 3,yearValue: 93),
  Sales(salesValue: 4,yearValue: 54),
  Sales(salesValue: 5,yearValue: 64),
  ];

  _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff990099)),
        id: 'Air Pollution',
        data: salesData1,
        domainFn: (Sales sales, _) => sales.yearValue,
        measureFn: (Sales sales, _) => sales.salesValue,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff109618)),
        id: 'Air Pollution',
        data: salesData2,
        domainFn: (Sales sales, _) => sales.yearValue,
        measureFn: (Sales sales, _) => sales.salesValue,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xffff9900)),
        id: 'Air Pollution',
        data: salesData3,
        domainFn: (Sales sales, _) => sales.yearValue,
        measureFn: (Sales sales, _) => sales.salesValue,
      ),
    );

  }

  @override
  void initState() {
    
    super.initState();
    _seriesLineData = List<charts.Series<Sales, int>> ();
    _salesData();
  }

  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: <Widget>[
            Text(
                  'Sales for the first 5 years',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
                        Expanded(
                          child: charts.LineChart(
                            _seriesLineData,
                            defaultRenderer: new charts.LineRendererConfig(
                                includeArea: true, stacked: true),
                            animate: true,
                            animationDuration: Duration(seconds: 5),
                            behaviors: [
        new charts.ChartTitle('Years',
            behaviorPosition: charts.BehaviorPosition.bottom,
            titleOutsideJustification:charts.OutsideJustification.middleDrawArea),
        new charts.ChartTitle('Sales',
            behaviorPosition: charts.BehaviorPosition.start,
            titleOutsideJustification: charts.OutsideJustification.middleDrawArea),
        new charts.ChartTitle('Departments',
            behaviorPosition: charts.BehaviorPosition.end,
            titleOutsideJustification:charts.OutsideJustification.middleDrawArea,
        )
                            ])

        )
          ],
        ),
      ),
      
    );
  }
}