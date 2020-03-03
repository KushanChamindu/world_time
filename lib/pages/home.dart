import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  _HomeState createState()=> _HomeState();
}
class _HomeState extends State<Home>{
  Map data={};
  @override
  Widget build(BuildContext context) {

    data= data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    String bgImage= data['isDayTime'] ? 'day.jpg':'night.jpg';
    Color bgColor= data['isDayTime']? Colors.white : Colors.indigo[900];
    Color FontColor =data['isDayTime']? Colors.black : Colors.grey[200];
//    print(data);
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,120,0,0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: ()async {
                    dynamic result= await Navigator.pushNamed(context, '/location');
                    setState((){
                      data={
                        'location':result["location"],
                        'time': result['time'],
                        'flag':result['flag'],
                        'isDayTime':result['isDayTime'],
                      };
                    });
                  },
                  icon: Icon(
                      Icons.edit_location,
                    color: FontColor,
                  ),
                label: Text(
                    "Edit location",
                  style: TextStyle(
                    color: FontColor,
                  ),
                ),
                ),
                SizedBox(height: 20.0,),
                Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        color: FontColor,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0,),
                Text(
                  data['time'],
                  style: TextStyle(
                    color: FontColor,
                    fontSize: 66.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
