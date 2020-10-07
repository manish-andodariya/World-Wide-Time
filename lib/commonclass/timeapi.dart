import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class Wtime {
  String location;
  String time;
  String flag;
  String url;
  bool isday;

  Wtime({this.location, this.flag, this.url});

  Future<void> getAPI() async {
    try {
      Response res = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(res.body);
      String date = data['datetime'];
      String offseth = data['utc_offset'].substring(1, 3);
      String offsetm = data['utc_offset'].substring(4, 6);
      DateTime now = DateTime.parse(date);
      print('$now');
      print('$offseth-$offsetm');
      now = now.add(Duration(hours: int.parse(offseth)));
      now = now.add(Duration(minutes: int.parse(offsetm)));
      print('$now');
      time = DateFormat.jm().format(now);
      isday = now.hour > 6 && now.hour < 20 ? true : false;
      print(isday);
    } catch (e) {
      print('Error Ocuured $e');
      time = 'Something went wrong !!!';
    }
  }
}
