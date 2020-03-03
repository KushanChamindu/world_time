import 'package:flutter/material.dart';
import 'package:wirld_timw/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ConnectionError extends StatefulWidget {
  @override
  _ConnectionErrorState createState() => _ConnectionErrorState();
}

class _ConnectionErrorState extends State<ConnectionError> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
        body :Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Container(child: Center(
                child: Image.asset('assets/connection.jpg'),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                    "Conection Lost",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3.0
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30,),
            SpinKitPulse(
              color: Colors.black,
              size: 60.0,
            ),
          ],
        ),
    );

  }
}
