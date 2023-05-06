import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};



  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty?data:(ModalRoute.of(context)?.settings.arguments as Map);
    print(data);
    String bgimg=data['isdaytime']?'day.png':'night.png';
    Color bgc=data['isdaytime']?Colors.blue:Colors.indigo;

    return Scaffold(
      backgroundColor: bgc,
      body:SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image:DecorationImage(
                image: AssetImage('assets/$bgimg'),
                fit: BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,120,0,0),
              child: Column(
                children: [
                  TextButton.icon(onPressed:
                      () async{
                    dynamic result=await Navigator.pushNamed(context,'/location');
                    setState(() {
                      data={
                        'location':result['location'],
                        'flag':result['flag'],
                        'time':result['time'],
                        'isdaytime':result['isdaytime'],
                      };
                    });
                    },
                      icon: Icon(Icons.edit_location,
                      color: Colors.grey[300],),
                      label: Text('Edit Location',
                      style: TextStyle(
                        color: Colors.grey[300],
                      ),)
                  ),
                  SizedBox(height: 20.0,),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data!['location'],
                        style:TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          color:Colors.white
                        )
                      )
                    ],
                  ),
                  SizedBox(height: 20.0,),
                    Text(
                      data!['time'],
                      style:TextStyle(
                          fontSize: 66.6,
                          letterSpacing: 2.0,
                          color:Colors.white)
                    )
                ],
              ),
            ),
          )),
    );
  }
}
