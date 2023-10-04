import 'dart:async';
import 'package:flutter/material.dart';
import 'tsd_locations.dart';
import 'package:geolocator/geolocator.dart';
import 'tsd_homepageinfo.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'tsd_infoscreens.dart';
import 'main.dart';


//TODO: encapsulate search bar in statless widget to be efficient
//TODO: delete padding around lottie,Change altitude to say 'floor', calibrate coloration (quadratic?)

//TODO: check geolocater package for platform-specific-settings AND ASK FOR PERMISSIONS
//TODO: textual directions, sql database (sqflite)
//add 3d anims??? .gib files???
Container freshMode1(MyHomePageState state){
  //print(state.fcpsLogIn.toString());
  // if(state.fcpsLogIn==false){
  //   return Container(padding: const EdgeInsets.all(20), alignment: Alignment.center, child: buildTypeWriter('Please Log In with FCPS'));
  // }
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(50),
    child:  ListView(shrinkWrap: true,
      children: [ const Text('WHERE TO?', style: TextStyle(fontFamily: 'Oswald', fontSize: 50),),  freshModeHotCold(parentState: state)],
    ),
  );
}
class freshModeHotCold extends StatefulWidget{
  const freshModeHotCold({super.key, required this.parentState});
  final MyHomePageState parentState;

  @override
  State<freshModeHotCold> createState() => HotColdState(state: parentState);
}
class HotColdState extends State<freshModeHotCold>{
  HotColdState({required this.state});
  final MyHomePageState state;
  //TODO: here define whether is in range or not
  bool searchMode = false;
  bool searchMode2 = false;
  String query='';
  String query2='';
  Location destination = Location.simple(38.8865184, -77.3913343, 82.9, 'Nobel Commons');
  Location currentLoc = Location.simple(38.8865184, -77.3913343, 82.9, 'Nobel Commons');
  String positionData = 'Loading...';
  String distanceToTargetText = 'Loading...';
  double distance = 0.0;
  double distanceFromSchool = 0.0;
  String directions ="Loading directions...";

  bool displayLocInfoScreen = false;
  int whichSearch = 1;
  Location infoScreenLocation = Location.simple(38.8865184, -77.3913343, 82.9, 'homeroom');

  @override
  void initState() {
    super.initState();
    Stream<Position> positionStream = Geolocator.getPositionStream(locationSettings: const LocationSettings( accuracy: LocationAccuracy.high, distanceFilter: 1,));
    positionStream.listen(
        (Position? position) {
          setState(() {
            if(position==null){
              positionData='Loading...';
              distanceToTargetText='Loading...';
            }
            else{
              positionData='${position.latitude.toString()}, ${position.longitude.toString()}, altitude: ${position.altitude.toString()}';
              distance = Geolocator.distanceBetween(position.latitude, position.longitude, destination.latitude, destination.longitude);
              distanceToTargetText = '${distance.toString()} m';
              distanceFromSchool = Geolocator.distanceBetween(position.latitude, position.longitude, 38.81842381360037, -77.16878373588156);
              if(distanceFromSchool < 150) {state.setState(() {
                state.isInRange = true;
              });}
              else {state.setState(() {
                state.isInRange = false;
              });}
            }
          });
        }
    );}



  void customShowSearch(){//TODO, when get off page, delete position stream (or automatic with deletion of widget?)
    // if (positionStream!=null) {
    //   searchMode ? positionStream?.pause() : positionStream?.resume();
    // }
      setState(() {
        searchMode ? searchMode=false : searchMode=true;
      });
    }
  void customShowSearch2(){
    setState(() {
      searchMode2 ? searchMode2=false : searchMode2=true;
    });
  }

  TextStyle contentBig = TextStyle(fontFamily: 'Oswald', fontSize: 20);
  @override
  Widget build(BuildContext context) {
    if(state.isInRange==false){
      return Container(padding: const EdgeInsets.all(20), alignment: Alignment.center, child: buildTypeWriter('You are not close enough to TJHSST'));
    }
    if(displayLocInfoScreen==true){
      return buildLocationInfoScreen(this, infoScreenLocation, whichSearch);
    }
    return ListView( shrinkWrap: true,
      children: [Row(children:[MaterialButton(child: whichIcon(searchMode2), onPressed: customShowSearch2,),buildTextBox(searchMode2, this, 2)]),
        Text('Current Location: ${currentLoc.roomNum}', style: contentBig),buildLocList(searchMode2, query2, this, 2),
        Row(children:[MaterialButton(child: whichIcon(searchMode), onPressed: customShowSearch,),buildTextBox(searchMode, this, 1)]),
        Text('Destination: ${destination.roomNum}', style: contentBig), buildLocList(searchMode, query, this, 1),
        Text(positionData),
        Text(distanceToTargetText),
        Text(directions),
        buildLottie(searchMode, searchMode2, distance),
        ],
    );
  }
}

//THIS METHOD IS NO LONGER USED, FOR REFERENCE WHEN ADDING BACK SETTINGS
Future<String> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }
  Position pos = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  return pos.toJson().toString();
}

Widget home0(MyHomePageState state){
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.stretch, children: [
    Expanded(flex: 1, child://TODO fix sizing of infoscreens icons as well
      Stack( children: [//TODO: fix sizing of profile to be dynmaic to screen size (using row flex +empty container)
        Container( padding: const EdgeInsets.all(40), alignment: Alignment.topRight, color: const Color(0xFF6F2E34), child: const Text('NavTJ', style: TextStyle(fontFamily: 'Oswald', fontSize: 50))), //TODO: check rendering as png AND svg
        Positioned(bottom: 0, child: InkWell(onTap: (){
          state.setState(() {
            state.infoNum=5;
            state.infoScreen=true;
          });
        },
            child: Container(height: 100, width: 100,  decoration: const BoxDecoration(image: DecorationImage(image:AssetImage("assets/profile.png"))),)),)
      ],),),
    Expanded(flex: 3, child: MyInfosWidget(myState: state))],);
}
Widget leaderboard2(){
  return Container(padding: const EdgeInsets.all(20), alignment: Alignment.center, child: buildTypeWriter('Leaderboard Coming Soon'));
}
Widget clueboard3(){
  return Container(padding: const EdgeInsets.all(20), alignment: Alignment.center, child: buildTypeWriter('Scavenger Hunt Coming Soon'));
  //return Center(child: pythonDataWidget());
}
Widget buildTypeWriter(String text){
  TextStyle typerStyle = const TextStyle(fontFamily: 'Oswald', fontSize: 50, );

  return IgnorePointer(child:  AnimatedTextKit(
      animatedTexts: [
        TypewriterAnimatedText(
            text,
            textStyle: typerStyle,
            speed: const Duration(milliseconds: 150),
            textAlign: TextAlign.center
        ),
      ],
      displayFullTextOnTap: true,//this is useless currently
      repeatForever: true,
      pause: const Duration(milliseconds: 65)),
  );
}
