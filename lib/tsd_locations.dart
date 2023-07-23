import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'tsd_pages.dart';

class Location{
  //the following are NEVER revealed to the user
  double longitude=0;
  double latitude=0;
  double? altitudeLevel;
  //the following are searchable things
  String? roomNum;
  String? teacherName; // teacher name
  List<String>? purpose; //bio lab, statistics, mobile-apps-club etc
  //in the future, have addable description user that can be used to search by (clubs, etc)

  Location.simple(this.latitude, this.longitude, this.altitudeLevel, this.roomNum){
  }
  Location.supersimple(this.roomNum);
  Location(this.latitude, this.longitude, this.altitudeLevel, this.roomNum, this.teacherName, this.purpose){
  }
}//bedrooms are numbered 220-223
List<String> roomNumsList = ['kitchen', 'living room','220', '221','222','223'];

Widget buildLocList(bool searchMode, String query, HotColdState hcs){
  if (!searchMode) return Container();
  ListView mLW = ListView();
  if(query=='') {//if nothing return them all
    mLW = ListView.builder(
      itemCount: roomNumsList.length,
      itemBuilder: (context, index) {
        var result = roomNumsList[index];
        return ListTile(
          title: Text(result),
          //onTap: changeDestination(result, hcs),
        );
      },
    );
  }else { //otherwise display relevant list
    List<String> matchQuery = [];
    for (var num in roomNumsList) {
      if (num.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(num);
      }
    }
    mLW = ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
          //onTap: changeDestination(result, hcs),
        );
      },
    );
  }
  return SizedBox(height: 300, child: mLW);
}

changeDestination(String value, HotColdState hcs){
  hcs.setState(() {
    hcs.destination = Location.supersimple(value);
  });
}

Widget buildTextBox(bool searchMode, HotColdState hcs){
  if (!searchMode) return Container();
  return SizedBox(width: 200, child: TextField(onChanged: (value)=> changeQuery(hcs, value)));
}
changeQuery(HotColdState hcs, String value){
  hcs.setState(() {
    hcs.query = value;
  });
}
Widget whichIcon(bool searchMode){
  if(searchMode) return Icon(Icons.arrow_back);
  return Icon(Icons.search_rounded);
}

Widget buildLottie(bool searchMode, double distance){
  double distanceCalibrate = distance/100;
  if (distanceCalibrate>1) distanceCalibrate=1;
  Color hotColdColor = Colors.black;
  Color? lottieColor = Color.lerp(Colors.red, Colors.blue, distanceCalibrate);
  lottieColor==null? hotColdColor=Colors.black: hotColdColor=lottieColor;

  if (!searchMode) return Lottie.asset('assets/108687-green-pinging.json', delegates: LottieDelegates(
    values: [ValueDelegate.color(["ellipes - 2", '**'], value: lottieColor),
      ValueDelegate.color(["ellipes - 3", '**'], value: lottieColor),
      ValueDelegate.color(["ellipes - 4", '**'], value: lottieColor),
      ValueDelegate.color(["ellipes - 5", '**'], value: lottieColor),
      ValueDelegate.color(["ellipes - 6", '**'], value: lottieColor),
      ValueDelegate.color(["ellipes - 7", '**'], value: lottieColor)],
  ));
  return Container();
}