import 'package:covidtrackerapp/View/world_stats.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  String loc;
  String confirmed_cases;
  String discharged;
  String deaths;
  String Total_cases;
  DetailsScreen(
      {super.key,
      required this.loc,
      required this.confirmed_cases,
      required this.discharged,
      required this.deaths,
      required this.Total_cases});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.loc),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        ReusableRow(title: 'Total Cases', value: widget.Total_cases),
                        ReusableRow(title: 'Confirmed Cases', value: widget.confirmed_cases),
                        ReusableRow(title: 'Discharges', value: widget.discharged),
                        ReusableRow(title: 'Deaths', value: widget.deaths),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 0),
                    child: Text(widget.loc,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
                  ),
                ),
              )
            ],)
          ],
        ),
      ),
    );
  }
}
