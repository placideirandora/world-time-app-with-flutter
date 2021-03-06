import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class WorldTime {
  String time;
  String flag;
  String url;
  bool isDayTime;
  String location = '';

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      http.Response response =
          await http.get(Uri.http('worldtimeapi.org', 'api/timezone/$url'));

      Map data = jsonDecode(response.body);

      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      DateTime now = DateTime.parse(dateTime);

      now = now.add(Duration(hours: int.parse(offset)));
      isDayTime = now.hour > 6 && now.hour < 19 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (err) {
      time = 'Could not get Time data';
    }
  }
}
