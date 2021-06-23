import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class worldCases extends StatefulWidget {
  @override
  _worldCasesState createState() => _worldCasesState();
}

class _worldCasesState extends State<worldCases> {
  final String url = "https://corona.lmao.ninja/v2/countries";

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

  Future showcard(String cases) async {
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
                    "Total Active Cases: $cases",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.red,
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
        title: Text("CoronaVirus Cases in the World"),
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
                        SnapShot.data[index]['cases'].toString(),
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
                                    height: 100,
                                    width: 100,
                                    //  shrinkWrap: true,
                                    image: AssetImage(
                                        'assets/images/earthtwo.png'),
                                  ),
                                  Text(
                                    SnapShot.data[index]['country'],
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
