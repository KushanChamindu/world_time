//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:wirld_timw/pages/home.dart';
import 'package:wirld_timw/pages/choose_location.dart';
import 'package:wirld_timw/pages/loading.dart';
import 'package:wirld_timw/pages/connectionless.dart';

void main() => runApp(MaterialApp(
  initialRoute:  '/',
  routes: {
    '/': (context)=> Loading(),
    '/home':(context)=> Home(),
    '/location':(context)=>chooseLocation(),
    '/error':(Context)=>ConnectionError(),
  },
));

