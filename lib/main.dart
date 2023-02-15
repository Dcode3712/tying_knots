import 'package:flutter/material.dart';
import 'package:tying_knots/Screen/home_Screen.dart';

import 'Model/basic_model.dart';

String APPNAME = "Tying Knots";

String BASE_URL = "https://expresstemplate.in/mix_drawing";

String BASIC_URL = "https://expresstemplate.in/mix_drawing/webservice/app_detail.php?code=en&pp=100&page=1&id=11";
String BOATING_URL = "https://expresstemplate.in/mix_drawing/webservice/app_detail.php?code=en&pp=100&page=1&id=12";
String CLIMBING_URL = "https://expresstemplate.in/mix_drawing/webservice/app_detail.php?code=en&pp=100&page=1&id=13";
String FISHING_URL = "https://expresstemplate.in/mix_drawing/webservice/app_detail.php?code=en&pp=100&page=1&id=14";
String FAVOURITE_URL = "https://expresstemplate.in/mix_drawing/webservice/bookmark.php?code=en&id=";

String SHARE_APP = "";
String MORE_APP = "";

List<String> favlist = [];
String favourite = "";

List<Datum> favdata = [];

List<Datum> basicdata = [];
List<Datum> boatingdata = [];
List<Datum> climbingdata = [];
List<Datum> fishingdata = [];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  HomeScreen(),
    );
  }
}
