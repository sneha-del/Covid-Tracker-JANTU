import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Vaccine extends StatefulWidget {
  @override
  _VaccineState createState() => _VaccineState();
}

class _VaccineState extends State<Vaccine> {
  final String url =
      "https://india-covid19vaccine.github.io/api/national_latest.json";
  Future<List> datas;

  Future<List> getData() async {
    var response = await Dio().get(url);
    return response.data;
  }

  @override
  void initState() {
    super.initState();
    datas = getData();
  }

  Future showcard(
      String population, total_doses, total_vaccinated, last_updated) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.purple[100],
            shape: RoundedRectangleBorder(),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text(
                    "Total pipulation: $population",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    "Total Doses: $total_doses",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.blue,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    "Total Vaccinated: $total_vaccinated",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.green,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    "Last Updated: $last_updated",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.pink,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vaccination in India"),
        backgroundColor: Colors.purpleAccent,
      ),
      backgroundColor: Colors.transparent,
      body: Container(
          padding: EdgeInsets.all(10.0),
          child: FutureBuilder(
            future: datas,
            builder: (BuildContext context, SnapShot) {
              if (SnapShot.hasData) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(180, 80, 0, 100),
                  child: Center(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1.0),
                      itemCount: 1,
                      itemBuilder: (BuildContext context, index) => SizedBox(
                        height: 30,
                        width: 50,
                        child: GestureDetector(
                          onTap: () => showcard(
                            SnapShot.data[index]['population'].toString(),
                            SnapShot.data[index]['total_doses'].toString(),
                            SnapShot.data[index]['total_vaccinated'].toString(),
                            SnapShot.data[index]['last_updated'].toString(),
                          ),
                          child: Card(
                            child: Flexible(
                              child: Container(
                                color: Colors.transparent,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image(
                                          width: 100,
                                          height: 100,
                                          image: AssetImage(
                                              'assets/images/vaccine.jpg')),
                                      Text("Click ME !")
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          )),
    );
  }
}
