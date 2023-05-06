import 'package:flutter/material.dart';
import 'package:worldtimer/services/worldtime.dart';
class chooseloc extends StatefulWidget {
  const chooseloc({Key? key}) : super(key: key);

  @override
  State<chooseloc> createState() => _chooselocState();
}

class _chooselocState extends State<chooseloc> {

  List<worldtime> locations = [
    worldtime(url: 'Europe/London', loctn: 'London', flag: 'uk.png'),
    worldtime(url: 'Europe/Berlin', loctn: 'Athens', flag: 'greece.png'),
    worldtime(url: 'Africa/Cairo', loctn: 'Cairo', flag: 'egypt.png'),
    worldtime(url: 'Africa/Nairobi', loctn: 'Nairobi', flag: 'kenya.png'),
    worldtime(url: 'America/Chicago', loctn: 'Chicago', flag: 'usa.png'),
    worldtime(url: 'America/New_York', loctn: 'New York', flag: 'usa.png'),
    worldtime(url: 'Asia/Seoul', loctn: 'Seoul', flag: 'south_korea.png'),
    worldtime(url: 'Asia/Jakarta', loctn: 'Jakarta', flag: 'indonesia.png'),
  ];
  void updatetime(index) async
  {worldtime instance=locations[index];
  await instance.gettime();
  Navigator.pop(context,{
    'location':instance.loctn,
    'flag':instance.flag,
    'time':instance.time,
    'isdaytime':instance.idt,
  });
  }



  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title:Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body:ListView.builder(
        itemBuilder: (context,index){
          return Padding(

            padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updatetime(index);

                },
                title:Text(locations[index].loctn) ,
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),

              ),
            ),
          );
        },
        itemCount: locations.length,),
    );
  }
}

