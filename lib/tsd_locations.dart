import 'package:flutter/material.dart';

class location{
  //the following are NEVER revealed to the user
  int? longitude;
  int? latitude;
  int? altitudeLevel;
  //the following are searchable things
  int? roomNum;
  String? teacherName; // teacher name
  List<String>? purpose; //bio lab, statistics, mobile-apps-club etc
  //in the future, have addable description user that can be used to search by (clubs, etc)

  location.simple(this.longitude, this.latitude, this.altitudeLevel, this.roomNum){
  }
  location(this.longitude, this.latitude, this.altitudeLevel, this.roomNum, this.teacherName, this.purpose){
  }
}//bedrooms are numbere 220-223
List<String> roomNumsList = ['kitchen', 'living room','220', '221','222','223'];


// class mySearchDelegate extends SearchDelegate{
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         onPressed: () {
//           query = '';
//         },
//         icon: Icon(Icons.clear),
//       ),
//     ];
//   }
//
//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       onPressed: () {
//         close(context, null);
//       },
//       icon: Icon(Icons.arrow_back),
//     );
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     List<String> matchQuery = [];
//     for (var num in roomNumsList) {
//       if (num.toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(num);
//       }
//     }
//     return ListView.builder(
//       itemCount: matchQuery.length,
//       itemBuilder: (context, index) {
//         var result = matchQuery[index];
//         return ListTile(
//           title: Text(result),
//           //onTap: openRoomDetailView(),
//         );
//       },
//     );
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List<String> matchQuery = [];
//     for (var num in roomNumsList) {
//       if (num.toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(num);
//       }
//     }
//     return ListView.builder(
//       itemCount: matchQuery.length,
//       itemBuilder: (context, index) {
//         var result = matchQuery[index];
//         return ListTile(
//           title: Text(result),
//           //onTap: openRoomDetailView(),
//         );
//       },
//     );
//   }
//
// }

Widget buildLocList(bool searchMode, String query){
  if (!searchMode) return Container();
  ListView mLW = ListView();
  if(query=='') {//if nothing return them all
    mLW = ListView.builder(
      itemCount: roomNumsList.length,
      itemBuilder: (context, index) {
        var result = roomNumsList[index];
        return ListTile(
          title: Text(result),
          //onTap: openRoomDetailView(),
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
          //onTap: openRoomDetailView(),
        );
      },
    );
  }
  return SizedBox(height: 300, child: mLW);
}

Widget buildTextBox(bool searchMode){
  if (!searchMode) return Container();
  return SizedBox(width: 200, child: TextField(cursorColor: Colors.green));
}
Widget whichIcon(bool searchMode){
  if(searchMode) return Icon(Icons.arrow_back);
  return Icon(Icons.search_rounded);
}