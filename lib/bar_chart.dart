import 'package:books_api_demo/model/corona_virus.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class BarChartDemo extends StatefulWidget {
  @override
  _BarChartDemoState createState() => _BarChartDemoState();

  
}

class _BarChartDemoState extends State<BarChartDemo> {

  List<charts.Series<Corona, String>> _seriesData;

_coronaData() {
  var data = [
    Corona(province: "Sindh",totalInfected: 550,death: 7,recoverPatient: 4),
    Corona(province: "Punjab",totalInfected: 200,death: 6,recoverPatient: 6),
    Corona(province: "Balochistan",totalInfected: 600,death: 5,recoverPatient: 3),
    Corona(province: "KPK",totalInfected: 189,death: 1,recoverPatient: 8),
  ];

  _seriesData.add(
     charts.Series(
       id: '2020',
       data: data,
       domainFn: (Corona corona,_) => corona.province,
       measureFn: (Corona corona,_) => corona.totalInfected,
       fillPatternFn: (_,__) => charts.FillPatternType.forwardHatch,
       fillColorFn: (Corona corona,_) => 
       charts.ColorUtil.fromDartColor(Colors.lightBlue)
     )

  );
}

  @override
  void initState() {
    
    super.initState();
     _seriesData = List<charts.Series<Corona, String>>(); 
    _coronaData();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: <Widget>[
            Text("Total Corona Cases in Pakistan",
             style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold,color: Colors.blue),
            ),
            Expanded(
              child: charts.BarChart(
                _seriesData,
                animate:true,
                barGroupingType: charts.BarGroupingType.grouped,
                animationDuration: Duration(seconds: 5),

                
              )
                

              
            )
          ],
        ),
      ),
      
    );
  }
}