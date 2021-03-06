import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class LoadingScreen extends StatefulWidget {
  LoadingScreen({Key key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String time = 'Loading...';

  void setupWorldTime() async {
    WorldTime instance =
        WorldTime(location: 'Paris', flag: 'paris.png', url: 'Europe/paris');

    await instance.getTime();

    setState(() {
      time = instance.time;
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
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(time),
      )),
    );
  }
}
