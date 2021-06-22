import 'package:covi_tracker/pages/Indiacases.dart';
import 'package:covi_tracker/pages/Q&A.dart';
import 'package:covi_tracker/pages/hospitals.dart';
import 'package:covi_tracker/pages/vaccine.dart';
import 'package:covi_tracker/pages/worldCases.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0XFFefedf2),
                      Color(0XFF8d12fe),
                    ]),
                image: DecorationImage(
                    alignment: Alignment.centerLeft,
                    image: AssetImage("assets/images/doct.png")),
              ),
              child: Padding(
                // padding: const EdgeInsets.all(144.0),
                padding: const EdgeInsets.only(left: 130.0),
                child: Center(
                  child: Text(
                    "Stay Home Stay Safe !",
                    style: TextStyle(
                        fontFamily: 'cursive',
                        fontSize: 22.0,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),

          // India
          Padding(
            padding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 0.0),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.0)),
              elevation: 18.0,
              height: 50.0,
              minWidth: 200.0,
              color: Colors.purpleAccent,
              splashColor: Colors.white,
              onPressed: () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => Indiacases(),
                  ),
                ),
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Center(
                  child: Text(
                    "India Corona Virus Cases",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
              ),
              // margin: EdgeInsets.symmetric(horizontal: 20),
              // height: 60,
              // width: double.infinity,
              // decoration: BoxDecoration(
              //   color: Colors.white,
              //   borderRadius: BorderRadius.circular(20),
              //   border: Border.all(
              //     color: Color(0XFFefedf2),
              //   ),
              // ),
            ),
          ),

          // world
          Padding(
            padding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 0.0),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.0)),
              elevation: 18.0,
              height: 50.0,
              minWidth: 200.0,
              color: Colors.purpleAccent,
              splashColor: Colors.white,
              onPressed: () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => worldCases(),
                  ),
                ),
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Center(
                  child: Text(
                    "World Corona Virus Cases",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
              ),

              // margin: EdgeInsets.symmetric(horizontal: 20),
              // height: 60,
              // width: double.infinity,
              // decoration: BoxDecoration(
              //   color: Colors.white,
              //   borderRadius: BorderRadius.circular(20),
              //   border: Border.all(
              //     color: Color(0XFFefedf2),
              //   ),
              // ),
            ),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 0.0),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.0)),
              elevation: 18.0,
              height: 50.0,
              minWidth: 200.0,
              color: Colors.purpleAccent,
              splashColor: Colors.white,
              onPressed: () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => Hospitals(),
                  ),
                ),
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Center(
                  child: Text(
                    "Recovery India/Hospitals",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
              ),
              // margin: EdgeInsets.symmetric(horizontal: 20),
              // height: 60,
              // width: double.infinity,
              // decoration: BoxDecoration(
              //   color: Colors.white,
              //   borderRadius: BorderRadius.circular(20),
              //   border: Border.all(
              //     color: Color(0XFFefedf2),
              //   ),
              // ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 0.0),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.0)),
              elevation: 18.0,
              height: 50.0,
              minWidth: 200.0,
              color: Colors.purpleAccent,
              splashColor: Colors.white,
              onPressed: () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => Vaccine(),
                  ),
                ),
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Center(
                  child: Text(
                    "Vaccinations trends",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
              ),
              // margin: EdgeInsets.symmetric(horizontal: 20),
              // height: 60,
              // width: double.infinity,
              // decoration: BoxDecoration(
              //   color: Colors.white,
              //   borderRadius: BorderRadius.circular(20),
              //   border: Border.all(
              //     color: Color(0XFFefedf2),
              //   ),
              // ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 0.0),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.0)),
              elevation: 18.0,
              height: 50.0,
              minWidth: 200.0,
              color: Colors.purpleAccent,
              splashColor: Colors.white,

              onPressed: () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => Questions(),
                  ),
                ),
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Center(
                  child: Text(
                    "Question & Answers",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
              ),
              // margin: EdgeInsets.symmetric(horizontal: 20),
              // height: 60,
              // width: double.infinity,
              // decoration: BoxDecoration(
              //   color: Colors.white,
              //   borderRadius: BorderRadius.circular(20),
              //   border: Border.all(
              //     color: Color(0XFFefedf2),
              //   ),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}

// clipping
class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 3, size.height, size.width, size.height - 60);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
