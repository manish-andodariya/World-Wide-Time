import 'package:flutter/material.dart';
import 'package:try4_7/commonclass/timeapi.dart';

// ignore: camel_case_types
class Get_location extends StatefulWidget {
  Get_location({Key key}) : super(key: key);

  @override
  _Get_locationState createState() => _Get_locationState();
}

// ignore: camel_case_types
class _Get_locationState extends State<Get_location> {
  List<Wtime> Locations = [
    Wtime(url: 'Asia/kolkata', location: 'India', flag: 'India.png'),
    Wtime(url: 'Africa/Johannesburg', location: 'Africa', flag: 'Africa.png'),
    Wtime(url: 'America/Chicago', location: 'America', flag: 'America.png'),
    Wtime(
        url: 'Australia/Sydney', location: 'Australia', flag: 'Australia.png'),
    Wtime(url: 'Europe/London', location: 'London', flag: 'London.png'),
  ];

  void updateLocation(index) async {
    Wtime Wt = Locations[index];
    await Wt.getAPI();
    Navigator.pop(context, {
      'location': Wt.location,
      'flag': Wt.flag,
      'time': Wt.time,
      'isday': Wt.isday
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[300],
        title: Text(
          'Choose Location',
          style: TextStyle(fontFamily: 'fontbody'),
        ),
      ),
      body: ListView.builder(
        itemCount: Locations.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              onTap: () {
                updateLocation(index);
              },
              title: Text(
                Locations[index].location,
                textAlign: TextAlign.left,
              ),
              leading: CircleAvatar(
                backgroundImage:
                    AssetImage('images/flags/' + Locations[index].flag),
              ),
            ),
          );
        },
      ),
    );
  }
}
