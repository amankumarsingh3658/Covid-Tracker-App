import 'package:covidtrackerapp/Services/Utiltites/states_services.dart';
import 'package:covidtrackerapp/View/detailscreen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class StatesListScreen extends StatefulWidget {
  const StatesListScreen({super.key});

  @override
  State<StatesListScreen> createState() => _StatesListScreenState();
}

class _StatesListScreenState extends State<StatesListScreen> {
  TextEditingController searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    StateServices stateServices = StateServices();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              onChanged: (value) {
                setState(() {});
              },
              controller: searchcontroller,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  hintText: 'Search With State Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50))),
            ),
          ),
          Expanded(
              child: FutureBuilder(
                  future: stateServices.getstateslist(),
                  builder: ((context, snapshot) {
                    if (!snapshot.hasData) {
                      return ListView.builder(
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey.shade700,
                              highlightColor: Colors.grey.shade100,
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Container(
                                      height: 10,
                                      width: 80,
                                      color: Colors.white,
                                    ),
                                    subtitle: Container(
                                      height: 10,
                                      width: 70,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            );
                          });
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.data!.regional!.length,
                          itemBuilder: (context, index) {
                            String name = snapshot
                                .data!.data!.regional![index].loc
                                .toString();

                            if (searchcontroller.text.isEmpty) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => DetailsScreen(
                                                  loc: snapshot.data!.data!
                                                      .regional![index].loc
                                                      .toString(),
                                                  confirmed_cases: snapshot
                                                      .data!
                                                      .data!
                                                      .regional![index]
                                                      .confirmedCasesIndian
                                                      .toString(),
                                                  discharged: snapshot
                                                      .data!
                                                      .data!
                                                      .regional![index]
                                                      .discharged
                                                      .toString(),
                                                  deaths: snapshot.data!.data!
                                                      .regional![index].deaths
                                                      .toString(),
                                                  Total_cases: snapshot
                                                      .data!
                                                      .data!
                                                      .regional![index]
                                                      .totalConfirmed
                                                      .toString())));
                                    },
                                    child: ListTile(
                                      subtitle: Row(
                                        children: [
                                          Text("Cases : "),
                                          Text(snapshot.data!.data!
                                              .regional![index].totalConfirmed
                                              .toString()),
                                        ],
                                      ),
                                      title: Text(snapshot
                                          .data!.data!.regional![index].loc
                                          .toString()),
                                    ),
                                  ),
                                ],
                              );
                            } else if (name.toLowerCase().contains(
                                searchcontroller.text.toLowerCase())) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => DetailsScreen(
                                                  loc: snapshot.data!.data!
                                                      .regional![index].loc
                                                      .toString(),
                                                  confirmed_cases: snapshot
                                                      .data!
                                                      .data!
                                                      .regional![index]
                                                      .confirmedCasesIndian
                                                      .toString(),
                                                  discharged: snapshot
                                                      .data!
                                                      .data!
                                                      .regional![index]
                                                      .discharged
                                                      .toString(),
                                                  deaths: snapshot.data!.data!
                                                      .regional![index].deaths
                                                      .toString(),
                                                  Total_cases: snapshot
                                                      .data!
                                                      .data!
                                                      .regional![index]
                                                      .totalConfirmed
                                                      .toString())));
                                    },
                                    child: ListTile(
                                      subtitle: Row(
                                        children: [
                                          Text("Cases : "),
                                          Text(snapshot.data!.data!
                                              .regional![index].totalConfirmed
                                              .toString()),
                                        ],
                                      ),
                                      title: Text(snapshot
                                          .data!.data!.regional![index].loc
                                          .toString()),
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return Container();
                            }
                          });
                    }
                  })))
        ],
      )),
    );
  }
}
