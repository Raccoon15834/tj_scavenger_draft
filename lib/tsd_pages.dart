import 'dart:async';
import 'package:flutter/material.dart';
import 'tsd_locations.dart';
import 'package:geolocator/geolocator.dart';
import 'tsd_homepageinfo.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'main.dart';


//TODO: encapsulate search bar in statless widget to be efficient
//TODO: delete padding around lottie,Change altitude to say 'floor', calibrate coloration (quadratic?)

//TODO: check geolocater package for platform-specific-settings AND ASK FOR PERMISSIONS
//TODO: textual directions, sql database (sqflite)
//add 3d anims??? .gib files???
Container freshMode1(){
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(50),
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
  bool searchMode = false;
  String query='';
  String positionData = 'Loading...';
  Location destination = Location.simple(38.8865184, -77.3913343, 82.9, 'homeroom');
  String distanceToTargetText = 'Loading...';
  double distance = 0.0;

  @override
  void initState() {
    Stream<Position> positionStream = Geolocator.getPositionStream(locationSettings: LocationSettings( accuracy: LocationAccuracy.high, distanceFilter: 1,));
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

            }
          });
        }
    );}



  void customShowSearch(){//TODO, when get off page, delete position stream (or automatic with deletion of widget?)
    debugPrint('search mode was $searchMode');
    // if (positionStream!=null) {
    //   searchMode ? positionStream?.pause() : positionStream?.resume();
    // }
      setState(() {
        searchMode ? searchMode=false : searchMode=true;
      });
    }


  @override
  Widget build(BuildContext context) {
    return Expanded( child: ListView(
      children: [Row(children:[IconButton(icon: whichIcon(searchMode), onPressed: customShowSearch,),buildTextBox(searchMode, this)]),
        Text('Destination: ${destination.roomNum}'), buildLocList(searchMode, query, this),
        Text(positionData),
        Text(distanceToTargetText),
        buildLottie(searchMode, distance),
        ],
    ));
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
        Container( padding: EdgeInsets.all(40), alignment: Alignment.topRight, child: Text('NavTJ', style: TextStyle(fontFamily: 'Oswald', fontSize: 50)), color: Color(0xFF6F2E34)), //TODO: check rendering as png AND svg
        Positioned(bottom: 0, child: InkWell(onTap: (){
          state.setState(() {
            state.infoNum=5;
            state.infoScreen=true;
          });
        },
            child: Container(height: 100, width: 100,  decoration: BoxDecoration(image: DecorationImage(image:AssetImage("assets/profile.png"))),)),)
      ],),),
    Expanded(flex: 3, child: MyInfosWidget(myState: state))],);
}
Widget leaderboard2(){
  return Container(padding: const EdgeInsets.all(20), alignment: Alignment.center, child: buildTypeWriter('Coming Soon'));
}
Widget clueboard3(){
  return Container(padding: const EdgeInsets.all(20), alignment: Alignment.center, child: buildTypeWriter('Coming Soon'));
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

// void _initStarCore() async{
//   StarCoreFactory starcore = await Starflut.getFactory();
// }
// class pythonDataWidget extends StatelessWidget{
//   const pythonDataWidget({super.key});
//
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(create: (_) => DataCubit()),
//       ],
//       child: const Center(
//         child: DataScreen(),
//       ),
//     );
//   }
// }
//
// class DataScreen extends StatefulWidget {
//   const DataScreen({Key? key}) : super(key: key);
//   @override
//   State<DataScreen> createState() => _DataScreenState();
// }
//
// class _DataScreenState extends State<DataScreen> {
//   @override
//   void initState() {
//     super.initState();
//     DataCubit.cubit(context).fetch();
//     //print(th);
//     //print(DataCubit.cubit(context).state);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // return FutureBuilder(
//     //   initialData: 'Loading...',
//     //   future: DataCubit.cubit(context).fetch(),
//     //   builder: (BuildContext context, AsyncSnapshot snapshot) {
//     //     return Text( snapshot.data );
//     //   }
//     // );
//
//     return BlocBuilder<DataCubit, DataState>(
//         builder: (context, state) {
//           // loading
//           if (state is DataFetchLoading) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//
//           // success
//           else if (state is DataFetchSuccess) {
//             return ListView(
//               children: state.data!.words
//                   .map(
//                     (word) => ListTile(
//                   title: Text(word),
//                 ),
//               )
//                   .toList(),
//             );
//           }
//
//           // failure
//           else if (state is DataFetchFailed) {
//             return Center(
//               child: Text(state.message!),
//             );
//           }
//
//           // something unexpected
//           return const Center(
//             child: Text('Something went wrong'),
//           );
//         },
//     );
//   }
// }
//
// pythonDataLoader(BuildContext context, DataState state){
//   // loading
//   if (state is DataFetchLoading) {
//     return const Center(
//       child: CircularProgressIndicator(),
//     );
//   }
//
//   // success
//   else if (state is DataFetchSuccess) {
//     return ListView(
//       children: state.data!.words
//           .map(
//             (word) => ListTile(
//           title: Text(word),
//         ),
//       )
//           .toList(),
//     );
//   }
//
//   // failure
//   else if (state is DataFetchFailed) {
//     return Center(
//       child: Text(state.message!),
//     );
//   }
//
//   // something unexpected
//   return const Center(
//     child: Text('Something went wrong'),
//   );
// }
