
import 'package:books_api_demo/model/task.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class PieChart extends StatefulWidget {
  @override
  _PieChartState createState() => _PieChartState();
}

class _PieChartState extends State<PieChart> {

  

  List<charts.Series<Task, String>> _seriesPieData;

  _generateTask() {
    var pieData = [
      Task (task: "Work",taskValue: 35.8,taskColor: Colors.lightBlue),
      Task (task: "Eat",taskValue: 8.3,taskColor: Colors.lightGreen),
      Task (task: "Commute",taskValue: 10.8,taskColor: Colors.indigoAccent),
      Task (task: "Tv",taskValue: 15.6,taskColor: Colors.yellow),
      Task (task: "Sleep",taskValue: 19.2,taskColor: Colors.blueAccent),
      Task (task: "Other",taskValue: 10.3,taskColor: Colors.redAccent),
    ];

    _seriesPieData.add(
       charts.Series(
         data: pieData,
         domainFn: (Task task,_) => task.task,
         measureFn: (Task task,_) => task.taskValue,
         colorFn: (Task task,_) => 
         charts.ColorUtil.fromDartColor(task.taskColor),
         id: "Daily Task",
         labelAccessorFn: (Task row,_) => '${row.taskValue}'

       )
    );
 }
 
  @override
  void initState() {
    
    super.initState();
    _seriesPieData = List<charts.Series<Task, String>>();
    _generateTask();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text("Time spent on Daily Task",
              style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold,color: Colors.blue),
              ),
              SizedBox(height: 10.0),
              Expanded(
                child: charts.PieChart(
                  _seriesPieData,
                  animate: true,
                  animationDuration: Duration(seconds: 5),
                  behaviors: [
                    charts.DatumLegend(
                      outsideJustification: charts.OutsideJustification.endDrawArea,
                      horizontalFirst: false,
                      desiredMaxRows: 3,
                      cellPadding: EdgeInsets.only(right:4.0, bottom:4.0),
                      entryTextStyle: charts.TextStyleSpec(
                        color: charts.MaterialPalette.purple.shadeDefault,
                        fontFamily: 'Georgia',
                        fontSize: 11,
                      )
                    )
                  ],
                  defaultRenderer: charts.ArcRendererConfig(
                    arcWidth: 100,
                    arcRendererDecorators: [
                      charts.ArcLabelDecorator(
                        labelPosition: charts.ArcLabelPosition.inside
                      )
                    ]
                  ),
                ),
              )

            ],
          ),
        ),
      ),
      
    );
  }
}