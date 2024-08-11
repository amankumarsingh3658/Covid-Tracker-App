import 'dart:async';
import 'package:covidtrackerapp/View/world_stats.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  late final AnimationController _controller = AnimationController(
    duration: Duration(seconds: 3),
    vsync: this)..repeat();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>WorldStatsSCreen()));
     });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              AnimatedBuilder(animation: _controller, builder: ((context, child) {
                return Transform.rotate(
                  angle: _controller.value * 2.0 * math.pi,
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.25,
                    width: MediaQuery.of(context).size.width*0.45,
                    child: Center(
                      child: Image(image: AssetImage('images/virus.png')), 
                    ),
                  )
                  );
              })),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.08,
                
              ),
              Text("Covid -19\n Tracker",
              textAlign: TextAlign.center ,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
