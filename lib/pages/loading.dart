import 'package:flutter/material.dart';
import 'package:wirld_timw/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setUpWorldTime() async{
    WorldTime instance= WorldTime(location: 'Colombo',flag: 'Sri lanka.jpg',url: 'Asia/Colombo');
    await instance.getTime();
    if(instance.time =="Error" ){
      print("Kushan");
      Navigator.pushReplacementNamed(context, '/error');
    }else{
      Navigator.pushReplacementNamed(context, '/home',arguments:{
        'location': instance.location,
        'flag':instance.flag,
        'time':instance.time,
        'isDayTime':instance.isDayTime,
      });
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUpWorldTime();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child:  SpinKitHourGlass(
          color: Colors.white,
          size: 50.0,
        ),
      )
    );
  }
}
