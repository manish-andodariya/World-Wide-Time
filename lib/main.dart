import 'package:flutter/material.dart';
import 'package:try4_7/pages/Get_Location.dart';
import 'package:try4_7/pages/Home.dart';
import 'package:try4_7/pages/Load.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // Define the default brightness and colors.
          brightness: Brightness.dark,
          primaryColor: Colors.green[800],
          accentColor: Colors.cyan[600],

          // Define the default font family.
          fontFamily: 'Georgia',

          // Define the default TextTheme. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          textTheme: TextTheme(
            bodyText2: TextStyle(fontSize: 16.0, fontFamily: 'fontbody'),
          ),
        ),
        title: 'Material App',
        initialRoute: '/',
        routes: {
          '/': (context) => Loading(),
          '/Home': (context) => Home(),
          '/Get_Location': (contex) => Get_location()
        },
      ),
    );
