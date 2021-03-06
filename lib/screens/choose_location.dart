import 'package:flutter/material.dart';

class ChooseLocationScreen extends StatefulWidget {
  ChooseLocationScreen({Key key}) : super(key: key);

  @override
  _ChooseLocationScreenState createState() => _ChooseLocationScreenState();
}

class _ChooseLocationScreenState extends State<ChooseLocationScreen> {
  int counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print('Init State Function Run!');

    getData();

    print('statement');
  }

  void getData() {
    // Simulate username request
    Future.delayed(Duration(seconds: 5), () => print('Yamamoto'));

    // Simulate user bio request
    Future.delayed(Duration(seconds: 2), () => print('Ninja from Japan'));
  }

  @override
  Widget build(BuildContext context) {
    print('Build Function Run!');

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
      ),
    );
  }
}
