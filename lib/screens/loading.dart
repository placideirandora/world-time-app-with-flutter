import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/services/world_time.dart';

class LoadingScreen extends StatefulWidget {
  LoadingScreen({Key key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void setupWorldTime() async {
    WorldTime instance =
        WorldTime(url: 'Africa/Kigali', location: 'Kigali', flag: 'rwanda.png');

    await instance.getTime();

    Future.delayed(
        Duration(seconds: 5),
        () => {
              Navigator.pushReplacementNamed(context, '/home', arguments: {
                'location': instance.location,
                'flag': instance.flag,
                'time': instance.time,
                'isDayTime': instance.isDayTime
              })
            });
  }

  @override
  void initState() {
    super.initState();

    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Container(
        margin: EdgeInsets.only(top: 200),
        height: 250,
        child: Column(
          children: [
            Center(
              child: Text(
                'World Time',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Spacer(),
            Center(
              child: SpinKitWave(
                color: Colors.white,
                size: 25,
              ),
            )
          ],
        ),
      ),
    );
  }
}
