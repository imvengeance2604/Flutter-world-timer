import 'package:flutter/material.dart';
import 'package:worldtimer/services/worldtime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class loading extends StatefulWidget {
    @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {
  String time='loading';

  void swt () async {
    worldtime instance=worldtime(loctn: 'Berlin',flag: 'germany.png',url: 'Europe/Berlin');
    await instance.gettime();
    Navigator.pushReplacementNamed(context, '/home' ,arguments: {
      'location':instance.loctn,
      'flag':instance.flag,
      'time':instance.time,
      'isdaytime':instance.idt,
    });

    setState(() {
      time=instance.time;
    });
  }


  @override

  void initState() {
    super.initState();
    swt();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body:Center(
          child: SpinKitWave(
            color: Colors.white,
            size: 70.0,
          ),

      ) ,

    );
  }
}
