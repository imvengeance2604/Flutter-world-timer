

import 'package:flutter/material.dart';
import 'package:worldtimer/pages/home.dart';
import 'package:worldtimer/pages/choseloc.dart';
import 'package:worldtimer/pages/loading.dart';
void main() => runApp(MaterialApp(

  routes:{
    '/':(context) => loading(),
    '/home':(context)=>Home(),
    '/location':(context)=>chooseloc(),
  }
));


