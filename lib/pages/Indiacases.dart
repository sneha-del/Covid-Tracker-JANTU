import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Indiacases extends StatefulWidget {
  @override
  _IndiacasesState createState() => _IndiacasesState();
}

class _IndiacasesState extends State<Indiacases> {
  final String url = "https://api.rootnet.in/covid19-in/stats/latest";
  Future<List> datas;

  Future<List> getData() async {
    var response = await Dio().get(url);
    return response.data['data']['regional'];
  }

  @override
  void initState() {
    super.initState();
    datas = getData();
  }

  Future showcard(String ind, death) async {
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
                    "Total Active Cases: $ind",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.red,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    "Total Death Cases: $death",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.green,
                        fontWeight: FontWeight.w800),
                  )
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
        title: Text("CoronaVirus Cases in India (STATEWISE"),
        backgroundColor: Colors.purpleAccent,
      ),
      backgroundColor: Colors.transparent,
      body: Container(
          padding: EdgeInsets.all(10.0),
          child: FutureBuilder(
            future: datas,
            builder: (BuildContext context, SnapShot) {
              if (SnapShot.hasData) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1.0),
                  itemBuilder: (BuildContext context, index) => SizedBox(
                    height: 30,
                    width: 50,
                    child: GestureDetector(
                      onTap: () => showcard(
                        SnapShot.data[index]['confirmedCasesIndian'].toString(),
                        SnapShot.data[index]['deaths'].toString(),
                      ),
                      child: Card(
                        child: Flexible(
                          child: Container(
                            color: Colors.transparent,
                            child: Center(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image(
                                    //  shrinkWrap: true,
                                    height: 100,
                                    width: 100,
                                    image:
                                        AssetImage('assets/images/india.png'),
                                  ),
                                  Text(
                                    SnapShot.data[index]['loc'],
                                    style: TextStyle(
                                        color: Colors.purple[400],
                                        fontWeight: FontWeight.w900),
                                  )
                                ],
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
