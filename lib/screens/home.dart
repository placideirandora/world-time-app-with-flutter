import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isEmpty ? ModalRoute.of(context).settings.arguments : data;

    String bgImage = data['isDayTime'] ? 'images/day.jpg' : 'images/night.jpg';
    Color color = data['isDayTime'] ? Colors.black : Colors.white;
    Color barColor =
        data['isDayTime'] ? Colors.yellowAccent[100] : Colors.pinkAccent[100];

    return Scaffold(
      backgroundColor: barColor,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(bgImage), fit: BoxFit.cover)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              OutlinedButton.icon(
                  onPressed: () async {
                    dynamic locationData =
                        await Navigator.pushNamed(context, '/location');

                    setState(() {
                      data = {
                        'location': locationData['location'],
                        'time': locationData['time'],
                        'flag': locationData['flag'],
                        'isDayTime': locationData['isDayTime']
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: color,
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(color: color),
                  )),
              SizedBox(
                height: 10,
              ),
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('images/${data['flag']}'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                          fontSize: 28, letterSpacing: 3, color: color),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                data['time'],
                style: TextStyle(fontSize: 50, color: color),
              )
            ],
          ),
        ),
      )),
    );
  }
}
