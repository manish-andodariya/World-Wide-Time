import 'package:flutter/material.dart';
import 'package:try4_7/pages/Get_Location.dart';
import 'package:try4_7/pages/Load.dart' as loadpage;
import 'package:try4_7/commonclass/timeapi.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isEmpty ? ModalRoute.of(context).settings.arguments : data;
    print(data);
    String bgimg = data['isday'] ? 'day.png' : 'night.png';
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/$bgimg'), fit: BoxFit.cover)),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                child: RaisedButton.icon(
                    color: Colors.purple[300],
                    onPressed: () async {
                      dynamic res =
                          await Navigator.pushNamed(context, '/Get_Location');
                      setState(() {
                        data = {
                          'time': res['time'],
                          'flag': res['flag'],
                          'location': res['location'],
                          'isday': res['isday']
                        };
                      });
                    },
                    icon: Icon(
                      Icons.edit_location,
                    ),
                    label: Text(
                      'Change Location',
                      style: TextStyle(fontFamily: 'fontbody'),
                    )),
              ),
              SizedBox(
                height: 40.0,
              ),
              Text(
                data['location'],
                style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2.0,
                    color: Colors.white),
              ),
              SizedBox(
                height: 55.0,
              ),
              Text(
                data['time'],
                style: TextStyle(
                    fontSize: 36.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2.0,
                    color: Colors.amber[600]),
              ),
              SizedBox(
                height: 80.0,
              ),
              CircleAvatar(
                backgroundImage: AssetImage('images/flags/${data['flag']}'),
                radius: 32.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
