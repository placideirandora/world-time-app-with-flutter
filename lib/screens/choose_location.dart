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

    print('Hello, World');
  }

  void getData() async {
    // Simulate username request
    // Wait until the username is returned before moving to the user bio
    String username =
        await Future.delayed(Duration(seconds: 5), () => 'Yamamoto');

    // Simulate user bio request
    // Wait before the user bio is returned before moving to the print statement
    String bio =
        await Future.delayed(Duration(seconds: 2), () => 'Ninja from Japan');

    print(username);

    print(bio);

    print('statement');
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
