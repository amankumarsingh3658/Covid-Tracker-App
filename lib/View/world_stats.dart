
import 'package:covidtrackerapp/Services/Utiltites/states_services.dart';
import 'package:covidtrackerapp/View/StatesList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatsSCreen extends StatefulWidget {
  const WorldStatsSCreen({Key? key}) : super(key: key);

  @override
  State<WorldStatsSCreen> createState() => _WorldStatsSCreenState();
}

class _WorldStatsSCreenState extends State<WorldStatsSCreen>
    with TickerProviderStateMixin {
  late final AnimationController _piechartcontroller =
      AnimationController(duration: Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _piechartcontroller.dispose();
  }

  final colorsList = [Color(0xff4285f4), Color(0xff1aa260), Color(0xffde5246)];

  @override
  Widget build(BuildContext context) {
    StateServices stateServices = StateServices();
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            FutureBuilder(
                future: stateServices.FetchIndiaData(),
                builder: ((context, snapshot) {
                  if (!snapshot.hasData) {
                    return Expanded(
                        child: SpinKitFadingCircle(
                            controller: _piechartcontroller,
                            size: 50,
                            color: Colors.white));
                  } else {
                    return Column(
                      children: [
                        PieChart(
                          dataMap: {
                            "Total": double.parse(
                                snapshot.data!.data!.unofficialSummary![0].total.toString()),
                            "Recovered": double.parse(snapshot
                                .data!.data!.unofficialSummary![0].recovered
                                .toString()),
                            "Deaths": double.parse(
                                snapshot.data!.data!.unofficialSummary![0].deaths.toString())
                          },
                          chartValuesOptions: ChartValuesOptions(
                              showChartValuesInPercentage: true),
                          animationDuration: Duration(milliseconds: 1200),
                          chartType: ChartType.ring,
                          colorList: colorsList,
                          chartRadius: MediaQuery.of(context).size.width / 3.2,
                          legendOptions: LegendOptions(
                              legendPosition: LegendPosition.left),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.height * 0.08),
                          child: Card(
                            child: Column(
                              children: [
                                ReusableRow(
                                    title: "Total",
                                    value: snapshot.data!.data!.summary!.total
                                        .toString()),
                                ReusableRow(
                                    title: "Confirmed Cases",
                                    value: snapshot.data!.data!.summary!
                                        .confirmedCasesIndian
                                        .toString()),
                                        ReusableRow(
                                    title: "Active Cases",
                                    value: snapshot.data!.data!.unofficialSummary![0]
                                        .active
                                        .toString()),
                                ReusableRow(
                                    title: "Discharged",
                                    value: snapshot
                                        .data!.data!.summary!.discharged
                                        .toString()),
                                ReusableRow(
                                    title: "Deaths",
                                    value: snapshot.data!.data!.summary!.deaths
                                        .toString()),
                                ReusableRow(
                                    title: "Recovered",
                                    value: snapshot.data!.data!
                                        .unofficialSummary![0].recovered
                                        .toString()),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: ((context) => StatesListScreen()))),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xff1aa260)),
                            child: Center(
                              child: Text('Track States'),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                }))
          ],
        ),
      )),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title, value;
  ReusableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 4),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(title), Text(value)],
          ),
          SizedBox(
            height: 5,
          ),
          Divider()
        ],
      ),
    );
  }
}
