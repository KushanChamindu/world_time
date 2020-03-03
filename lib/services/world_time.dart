import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
//import 'world_time/assets/country-continent.txt';

class WorldTime{
  String location; //location of the UI
  String time;  //the time in the location
  String  flag;  //url to as assets flag icon
  String url;   //url to the location api endpoint
  bool isDayTime; //bool true or false if day or night

  WorldTime({this.location,this.url,this.flag});

  Future<void> getTime()async{           // node js 'Promise'
    try{
      Response response=await get('http://worldtimeapi.org/api/timezone/$url');
      Map data= jsonDecode(response.body);
//    print(data);
      String dateTime=data['datetime'];
      String offset=data['utc_offset'];
//    print(dateTime);
//    print(offset);
      DateTime now= DateTime.parse(dateTime);
//    print(now);
      int offset_second= int.parse(offset.substring(1,3))*3600 + int.parse(offset.substring(4,6))*60 ;
//    print(offset_second);
      now=now.add(Duration(seconds: offset_second));
      isDayTime= now.hour>6 && now.hour<19 ? true:false;
      time=DateFormat.jm().format(now);
    }catch(e){
      time="Error";
      print("Error occur");
    }
  }
}