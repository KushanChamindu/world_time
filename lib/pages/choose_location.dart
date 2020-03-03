import 'package:flutter/material.dart';
import 'package:wirld_timw/services/world_time.dart';

class chooseLocation extends StatefulWidget {
  @override
  _chooseLocationState createState() => _chooseLocationState();
}

class _chooseLocationState extends State<chooseLocation> {
  List <WorldTime> locations= [
    WorldTime(location: 'Colombo',flag: 'lanka.jpg',url: 'Asia/Colombo'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];
  void update_time(index) async{
    WorldTime instance=locations[index];
    await instance.getTime();
    if(instance.time =="Error" ){
      print("Kushan");
      Navigator.pushReplacementNamed(context, '/error');
    }else{
    Navigator.pop(context,{
      'location':instance.location,
      'time': instance.time,
      'flag':instance.flag,
      'isDayTime':instance.isDayTime,
    });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Choose location"),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount:locations.length,
          itemBuilder:(context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 1.0),
              child: Card(
                child:ListTile(
                  onTap: (){
                    update_time(index);
                  },
                  title: Text(
                    locations[index].location,
                  ),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}


