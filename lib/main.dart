import 'package:flutter/material.dart';
import 'tsd_navbar.dart';
import 'tsd_pages.dart';
import 'tsd_infoscreens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lottie/lottie.dart';
import 'firebase_options.dart';

// <key>NSLocationTemporaryUsageDescriptionDictionary</key>
// <dict>
// <key>YourPurposeKey</key>
// <string>The example App requires temporary access to the device&apos;s precise location.</string>
// </dict>
//ADD TO THE info.plist of ios inorder to await _geolocatorPlatform.requestTemporaryFullAccuracy(
//       purposeKey: "TemporaryPreciseAccuracy"

void main() async{ //MaterialApp is stateless, Scaffold is stateful
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  //final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: FutureBuilder(
        future: Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
        builder: (context, snapshot) {
          print(snapshot.connectionState);
          // if (snapshot.hasError) {
          //   print(snapshot.error.toString);
          //   return Text('broken');
          // }

          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF6F2E34)),
                  useMaterial3: true,
                  fontFamily: 'SourceCodePro'
              ),
              home: const MyHomePage(),
            );
          }
          return Container(height: double.infinity, width: double.infinity, color: Color(0xFFEFE0CB), alignment: Alignment.center,
            child: Lottie.asset('animation_llg1ssw1.json',width: double.infinity));
        },
      ),
    );
  }

}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int page=0; //will number pages 1-4
  bool infoScreen = false; //for room info, for homepage info
  int infoNum = 0;
  bool? fcpsLogIn = false;
  bool isInRange = false;
  String? profileEmail = 'unknown';
  String? userDisplayName = 'unknown';

  @override
  void initState() {
    fcpsLogIn = profileEmail?.endsWith('fcpsschools.net');
  }


  @override
  Widget build(BuildContext context) {
    if (infoScreen) {
      switch(infoNum){
        case 1: return howitworks1(this); break;
        case 2: return howitwasbuilt2(this); break;
        case 3: return meetteam3(this); break;
        case 4: return learnmore4(this); break;
        case 5: return profileInfo(this, profileEmail, userDisplayName); break;
        case 6: return loginPage(this);
      }
    }
    // if (!isInRange) {
    //   return Scaffold(body:
    //   InkWell(onTap: () {
    //     _nextObstacleTemp();
    //   },
    //       splashColor: Color(0xFFBBAC8E),
    //       splashFactory: InkRipple.splashFactory,
    //       child: Ink(color: Color(0xFFEFE0CB), child:
    //       Column(children: [Flexible(
    //           flex: 3,
    //           child: Container(padding: EdgeInsets.all(25),alignment: Alignment.bottomCenter, child: buildTypeWriter('You are not in range! (⌐■_■)'))),
    //         Flexible(flex: 2, child: Container(alignment: Alignment.topCenter, child: const Text('tap to skip for now', style: TextStyle(
    //             color: Colors.black,
    //             fontFamily: 'SourceCodePro',
    //             fontSize: 20)))
    //         )]))));
    // }if (!isLoggedIn) {
    //   return Scaffold(body:
    //   InkWell(onTap: () {
    //     _nextObstacleTemp();
    //   },
    //       splashColor: Color(0xFFBBAC8E),
    //       splashFactory: InkRipple.splashFactory,
    //       child: Ink(color: Color(0xFFEFE0CB), child:
    //       Column(children: [Flexible(
    //           flex: 3,
    //           child: Container(padding: EdgeInsets.all(25), alignment: Alignment.bottomCenter, child: buildTypeWriter('Please Log In! ಠﻌಠ'))),
    //          Flexible(flex: 2, child: Container(alignment: Alignment.topCenter, child: const Text('tap to skip for now', style: TextStyle(
    //             color: Colors.black,
    //             fontFamily: 'SourceCodePro',
    //             fontSize: 20)))
    //          )]))));
    // }
    return Scaffold(
      backgroundColor: Color(0xFFEFE0CB),
      appBar: AppBar(
        backgroundColor: Color(0xFF6F2E34),
        title: Text('NavTJ', style: TextStyle(color: Color(0xFFEFE0CB)),),
      ),
      body: buildPages(page, this),
      bottomNavigationBar: buildNav(this),
    );
  }
}

Widget buildPages(int page, MyHomePageState state){
  switch(page){
    case 1: return freshMode1(); break;
    case 2: return leaderboard2(); break;
    case 3: return clueboard3(); break;
    default: return home0(state); //case 0
  }
}
