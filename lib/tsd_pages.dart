import 'package:flutter/material.dart';
import 'tsd_locations.dart';
import 'package:geolocator/geolocator.dart';


//TODO: implement search bar functionality in encapsulating statless widget to be efficient
//TODO:  make the search bar dynamic
//TODO: delete padding around lottie,

//TODO: fonts, background image
//TODO: make updating outputs continuous
//TODO: OUTPUTS, change color of lottie (callibrate)
//TODO: add textual directions on the where to page
Container freshMode1(){
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(50),
    child: const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text('WHERE TO?', style: TextStyle(fontFamily: 'Oswald', fontSize: 50),), freshModeHotCold()],
    ),
  );
}
class freshModeHotCold extends StatefulWidget{
  const freshModeHotCold({super.key});

  @override
  State<freshModeHotCold> createState() => HotColdState();
}
class HotColdState extends State<freshModeHotCold> {
  String destination = 'Destination: homeroom';
  bool searchMode = false;
  String query='';


  void customShowSearch(){
    setState(() {
      searchMode ? searchMode=false : searchMode=true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded( child: ListView(
      children: [Row(children:[IconButton(icon: whichIcon(searchMode), onPressed: customShowSearch,),buildTextBox(searchMode, this)]),
        Text(destination), buildLocList(searchMode, query, this),
        FutureBuilder(
          future: determinePosition(),
          initialData: 'loading data..',
            builder: (context, snapshot) {
              return Column(children: [Text('geolocation: ${snapshot.data}'), Text('distance: ')]);
            }),
        buildLottie(searchMode),
        ],
    ));
  }
}

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


//start search immediately, in initState, or set to default like you are in____
Container home0(){
  return Container();
}
Container leaderboard2(){
  return Container();
}
Container clueboard3(){
  return Container();
}
