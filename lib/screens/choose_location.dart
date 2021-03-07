import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocationScreen extends StatefulWidget {
  ChooseLocationScreen({Key key}) : super(key: key);

  @override
  _ChooseLocationScreenState createState() => _ChooseLocationScreenState();
}

class _ChooseLocationScreenState extends State<ChooseLocationScreen> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Kigali', location: 'Kigali', flag: 'rwanda.png'),
  ];

  bool loading = false;
  int locationIndex = -1;

  void updateTime(int index) async {
    setState(() {
      loading = true;
      locationIndex = index;
    });

    WorldTime location = locations[index];

    await location.getTime();

    setState(() {
      loading = false;
      locationIndex = -1;
    });

    Navigator.pop(context, {
      'location': location.location,
      'flag': location.flag,
      'time': location.time,
      'isDayTime': location.isDayTime
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.cyan[800],
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Column(children: [
            Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(locations[index].location),
                    loading && index == locationIndex
                        ? SpinKitWave(
                            color: Colors.grey,
                            size: 15,
                          )
                        : Text('')
                  ],
                ),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('images/${locations[index].flag}'),
                ),
              ),
            ),
          ]);
        },
      ),
    );
  }
}
