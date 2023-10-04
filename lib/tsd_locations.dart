import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'tsd_pages.dart';
import 'tsd_roomlist.dart';

class Location{
  //the following are NEVER revealed to the user
  double longitude=0;
  double latitude=0;
  double? altitudeLevel;
  //the following are searchable things
  String roomNum;
  String teacherName = 'Coming Soon'; // teacher name
  String purpose = 'Coming Soon'; //bio lab, statistics, mobile-apps-club etc
  //in the future, have addable description user that can be used to search by (clubs, etc)

  Location.simple(this.latitude, this.longitude, this.altitudeLevel, this.roomNum);
  Location.supersimple(this.roomNum);
  Location(this.latitude, this.longitude, this.altitudeLevel, this.roomNum, this.teacherName, this.purpose);

}//bedrooms are numbered 220-223


Widget buildLocList(bool searchMode, String query, HotColdState hcs, int num){
  if (!searchMode) return Container();
  ListView mLW = ListView();
  if(query=='') {//if nothing return them all
    mLW = ListView.builder(
      itemCount: roomList.length,
      itemBuilder: (context, index) {
        var result = roomList[index].roomNum;
        return locationTile(result, hcs, index, num);
      },
    );
  }else { //otherwise display relevant list
    List<String> matchQuery = [];
    List<int> indeces = [];
    for (int i=0; i<roomList.length; i++) {
      var num = roomList[i].roomNum;
      if (num.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(num);
        indeces.add(i);
      }
    }
    mLW = ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        var i = indeces[index];
        return locationTile(result, hcs, i, num);
      },
    );
  }
  return SizedBox(height: 300, child: mLW);
}
ListTile locationTile(String result, HotColdState hcs, int index, int num){
  return ListTile(
    title: Text(result),
    onTap: (){
      hcs.state.setState(() {
        hcs.displayLocInfoScreen= true;
        hcs.infoScreenLocation = roomList[index];
        hcs.whichSearch = num;
      });
    },
  );
}


Widget buildTextBox(bool searchMode, HotColdState hcs, int num){
  FocusNode fN = FocusNode();
  fN.requestFocus();
  if (!searchMode) return Container();
  return SizedBox(width: 200, child: TextField(onChanged: (value)=> changeQuery(hcs, value, num), focusNode: fN));
}
changeQuery(HotColdState hcs, String value, int num){
  hcs.setState(() {
    if(num==1) hcs.query = value;
    if(num==2) hcs.query2 = value;
  });
}
Widget whichIcon(bool searchMode){
  BoxDecoration roundedBoxDeco = const BoxDecoration(
      color: Color(0xFFEE7674),
      borderRadius: BorderRadius.all(Radius.circular(10)) );
  if(searchMode) return const Icon(Icons.arrow_back);
  return  Row(children:[Icon(Icons.search_rounded), Container(width: 220, height: 30, decoration: roundedBoxDeco)]);//TODO make this a row
}

Widget buildLottie(bool searchMode, bool searchMode2, double distance){
  double distanceCalibrate = distance/100;//TODO scale to distance to location
  if (distanceCalibrate>1) distanceCalibrate=1;
  Color hotColdColor = Colors.black;
  Color? lottieColor = Color.lerp(Colors.red, Colors.blue, distanceCalibrate);
  lottieColor==null? hotColdColor=Colors.black: hotColdColor=lottieColor;

  if (!searchMode && !searchMode2) {
    return Lottie.asset(
        'assets/108687-green-pinging.json', delegates: LottieDelegates(
      values: [ValueDelegate.color(["ellipes - 2", '**'], value: lottieColor),
        ValueDelegate.color(["ellipes - 3", '**'], value: lottieColor),
        ValueDelegate.color(["ellipes - 4", '**'], value: lottieColor),
        ValueDelegate.color(["ellipes - 5", '**'], value: lottieColor),
        ValueDelegate.color(["ellipes - 6", '**'], value: lottieColor),
        ValueDelegate.color(["ellipes - 7", '**'], value: lottieColor)],
    ));
  }
  return Container();
}