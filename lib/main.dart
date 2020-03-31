import 'package:books_api_demo/bar_chart.dart';
import 'package:books_api_demo/line_chart.dart';
import 'package:books_api_demo/pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() { 
  
  runApp(MaterialApp(
  
  debugShowCheckedModeBanner: false,
  home: TabCharts(),
));
}
class TabCharts extends StatefulWidget {
  @override
  _TabChartsState createState() => _TabChartsState();
}

class _TabChartsState extends State<TabCharts> {

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Charts",
            style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold)
            ),
            bottom: TabBar(
              unselectedLabelColor: Colors.lightBlue[100],
              indicatorColor: Colors.white,
              labelPadding: EdgeInsets.only(bottom:8.0),
              tabs: <Widget>[
               Tab(icon: Icon(FontAwesomeIcons.solidChartBar)),
                Tab(icon: Icon(FontAwesomeIcons.chartPie)),
                Tab(icon: Icon(FontAwesomeIcons.chartLine)),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              BarChartDemo(),
              PieChart(),
              LineChartDemo()

            ],
          ),
        )
      ),
      
    );
  }
}