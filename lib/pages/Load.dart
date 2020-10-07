import 'package:flutter/material.dart';
import 'package:try4_7/commonclass/timeapi.dart';

class Loading extends StatefulWidget {
  Loading({Key key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'Loading';
  void getTime() async {
    Wtime Wt = Wtime(location: 'India', flag: 'India.png', url: 'Asia/kolkata');
    await Wt.getAPI();
    Navigator.pushReplacementNamed(context, '/Home', arguments: {
      'location': Wt.location,
      'flag': Wt.flag,
      'time': Wt.time,
      'isday': Wt.isday
    });
  }

  @override
  void initState() {
    super.initState();
    print('init method called');
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 40.0, 10.0, 10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.hourglass_empty),
              SizedBox(height: 10.0),
              Text('Loading.. :)'),
            ],
          ),
        ),
      )),
    );
  }
}
