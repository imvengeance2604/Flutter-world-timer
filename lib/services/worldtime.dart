import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class worldtime{

  String loctn;
  String time="";
  String flag;
  String url;
  bool? idt;
  worldtime({required this.loctn,required this.flag,required this.url});

  Future<void> gettime() async {
    Response response=await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
    Map data=jsonDecode(response.body);
    String datetime=data['datetime'];
    String offset= data['utc_offset'].substring(1,3);

    DateTime now=DateTime.parse(datetime);
    now=now.add(Duration(hours:int.parse(offset)));
    idt=now.hour>6&&now.hour<19?true:false;
    time=DateFormat.jm().format(now);


  }

}